# tab_controller.rb
#  
# Copyright (C) 2008-2009  James Turnbull <james@lovedthanlost.net>
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301, USA.

class TabController < ApplicationController
  unloadable
  
  layout 'base'
  
  before_action :find_project, :authorize, :only => [:show]
  
  def show
    @tab_text = Tab.get_tab_text(@project)
  end

  def system_show
    @tab_text = Setting.plugin_redmine_tab['system_tab_text']
    render :action => 'show'
  end
  
  private
  
  def find_project
  # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
