class UsersController < ApplicationController
    def index
        if current_user.try(:admin?)
            @users= User.all
        else
            redirect_to dashboard_path
        end
    end
    def lock
        @user= User.find(params[:id])
        @user.lock_access!
        redirect_to users_path
    end
    def unlock
        @user= User.find(params[:id])
        @user.unlock_access!
        redirect_to users_path
    end
end
