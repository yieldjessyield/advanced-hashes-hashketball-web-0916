require "pry"

def game_hash
  {
    :home =>
      {
        :team_name => "Brooklyn Nets",
        :colors =>["Black", "White"],
        :players =>
          {
            "Alan Anderson" => {
              :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1
            },
            "Reggie Evans" => {
             :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7
            },
            "Brook Lopez" => {
             :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15
            },
            "Mason Plumlee" => {
             :number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5
            },
            "Jason Terry" => {
             :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1
            }
          }
      },
    :away =>
      {
        :team_name => "Charlotte Hornets",
        :colors =>["Turquoise", "Purple"],
        :players =>
          {
            "Jeff Adrien" => {
              :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2
            },
            "Bismak Biyombo" => {
              :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10
            },
            "DeSagna Diop" => {
              :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5
            },
            "Ben Gordon" => {
              :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0
            },
            "Brendan Haywood" => {
              :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12
            }
          }
      }
  }

end
# These things are the same!
#:home => "home"
#home: "home"

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    #binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        #binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        if attribute == :players
          data.each do |data_item|
        #binding.pry
      end
      end
    end
  end
end
good_practices



def num_points_scored(player_name)
  scored_points = nil
  game_hash.collect do |location, team_data|

    team_data.collect do |attribute, data|
      if attribute == :players
        data.collect do |name, stats|
          #binding.pry
          if name == player_name
            stats.collect do |key, value|
              if key == :points
                scored_points = value
            #binding.pry
              end
            end
          end
        end
      end
    end
  end
  scored_points
end

def shoe_size(player_name)
  size_of_shoe = nil
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :players
        data.collect do |name, stats|
          if name == player_name
            stats.collect do |key, value|
              if key == :shoe
                size_of_shoe = value
              end
            end
          end
        end
      end
    end
  end
  size_of_shoe
end

def team_colors(team_name)
  team_location = nil
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      #attribute = :team_name, ect.
      if data == team_name
        team_location = location
      end
    end
  end
game_hash[team_location][:colors]
end

def team_names
all_teams = []
  game_hash.each do |location, team_data|
    #binding.pry
    team_data.each do |attribute, data|
      if attribute == :team_name
        all_teams << data
      end
    end
  end
  all_teams
end

def player_numbers(team_name)
all_player_numbers = []
team_location = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        team_location = location
        #attribute.each do |k, v|
        game_hash[team_location][:players].each do |player, stats|
          stats.each do |key, value|
            if key == :number
              all_player_numbers << value
            end
      #binding.pry
          end
        end
      end
    end
  end
  all_player_numbers
end

def player_stats(player_name)
players_stats = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
        #binding.pry
            if player == player_name
              players_stats = stats
            end
        end
      end
    end
  end
  players_stats
end

def big_shoe_rebounds
largest_shoe_size = 0
player_largest_shoe_size = nil
largest_location = nil
player_with_largest_shoes = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          stats.each do |key, info|
            if key == :shoe && info > largest_shoe_size
          #binding.pry
              largest_shoe_size = info
              player_largest_shoe_size = player
              largest_location = location
            end
          end
        end
      end
    end
  end
  game_hash[largest_location][:players][player_largest_shoe_size][:rebounds]
end



















