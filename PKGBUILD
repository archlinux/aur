#!/bin/bash

# Configuration file path
config_file="$HOME/.config/oma/.config"

# Function to display initialization prompt
display_init_prompt() {
    clear
    echo "==============================="
    echo "| Welcome to OptimizeMyArch!  |"
    echo "==============================="
    echo "Let's set up your Arch Linux environment."
    echo ""

    # Desktop Environment Options
    echo "Choose your preferred desktop environment:"
    echo "1. KDE Plasma [Default]"
    echo "2. GNOME"
    echo "3. Xfce"
    echo "4. Cinnamon"
    echo "5. MATE"
    echo "6. LXQt"
    echo "7. i3 (tiling window manager)"
    read -p "Enter the number of your preferred desktop environment [1]: " desktop_environment_choice

    case $desktop_environment_choice in
        1) desktop_environment="KDE Plasma" ;;
        2) desktop_environment="GNOME" ;;
        3) desktop_environment="Xfce" ;;
        4) desktop_environment="Cinnamon" ;;
        5) desktop_environment="MATE" ;;
        6) desktop_environment="LXQt" ;;
        7) desktop_environment="i3" ;;
        *) desktop_environment="KDE Plasma" ;;
    esac

    # Disk Type Options
    echo ""
    echo "Choose your disk type:"
    echo "1. SATA (sda) [Default]"
    echo "2. HDD (sdb, etc.)"
    echo "3. SSD (sdb, etc.)"
    echo "4. NVMe"
    read -p "Enter the number of your disk type [1]: " disk_type_choice

    case $disk_type_choice in
        1) disk_type="SATA" ;;
        2) disk_type="HDD" ;;
        3) disk_type="SSD" ;;
        4) disk_type="NVMe" ;;
        *) disk_type="SATA" ;;
    esac

    # AUR Helper Options
    echo ""
    echo "Choose your AUR helper:"
    echo "1. paru [Default]"
    echo "2. yay"
    echo "3. pacman"
    read -p "Enter the number of your preferred AUR helper [1]: " aur_helper_choice

    case $aur_helper_choice in
        1) aur_helper="paru" ;;
        2) aur_helper="yay" ;;
        3) aur_helper="pacman" ;;
        *) aur_helper="paru" ;;
    esac

    # Purpose of using Arch Linux Options
    echo ""
    echo "Choose the primary purpose of using Arch Linux:"
    echo "1. Casual/Browsing [Default]"
    echo "2. Coding/Development"
    echo "3. Gaming"
    echo "4. Multimedia/Content Creation"
    echo "5. Server/Networking"
    read -p "Enter the number of your primary purpose [1]: " purpose_choice

    case $purpose_choice in
        1) purpose="Casual/Browsing" ;;
        2) purpose="Coding/Development" ;;
        3) purpose="Gaming" ;;
        4) purpose="Multimedia/Content Creation" ;;
        5) purpose="Server/Networking" ;;
        *) purpose="Casual/Browsing" ;;
    esac

    read -p "Would you like to optimize for this purpose? (y/N): " optimize_choice
    case $optimize_choice in
        [yY]) optimize_purpose="y" ;;
        *) optimize_purpose="n" ;;
    esac
}

# Function to install dependencies based on user input
install_dependencies() {
    case $1 in
        "paru")
            if ! command -v paru &> /dev/null; then
                git clone https://aur.archlinux.org/paru.git
                cd paru || exit
                makepkg -si --noconfirm
                cd .. || exit
                rm -rf paru
            fi
            ;;
        "yay")
            if ! command -v yay &> /dev/null; then
                sudo pacman -S --needed --noconfirm yay
            fi
            ;;
        *)
            echo "Invalid AUR helper selected. Using pacman as default."
            ;;
    esac
}

# Function to perform initialization
perform_init() {
    display_init_prompt
    clear
    echo "==============================="
    echo "| Initializing OptimizeMyArch |"
    echo "==============================="
    echo "Desktop environment: $desktop_environment"
    echo "Disk type: $disk_type"
    echo "AUR helper: $aur_helper"
    echo "Purpose: $purpose"
    echo ""
    echo "Checking and installing dependencies..."
    install_dependencies "$aur_helper"
    echo "Initialization complete!"

    # Additional optimizations based on desktop environment and purpose
   if [[ "$optimize_purpose" == "y" ]]; then
    case $desktop_environment in
        "KDE Plasma")
            # Additional KDE Plasma optimizations
            echo "Performing KDE Plasma optimizations..."
            # Adjust font rendering for better clarity
            echo "Adjusting font rendering..."
            kwriteconfig --file ~/.config/kdeglobals --group General --key UseFontHinting "true"
            kwriteconfig --file ~/.config/kdeglobals --group General --key AntiAliasing "true"
            kwriteconfig --file ~/.config/kdeglobals --group General --key ForceFontDPI "96"
            kwriteconfig --file ~/.config/kdeglobals --group General --key ForceFontDPIValue "96"

            # Enable smooth animations
            echo "Enabling smooth animations..."
            kwriteconfig --file ~/.config/kwinrc --group Compositing --key AnimationSpeed "3"

            # Increase titlebar button size
            echo "Increasing titlebar button size..."
            kwriteconfig --file ~/.config/kdeglobals --group KDE --key TitleBarButtons "3"

            # Apply Breeze Dark theme
            echo "Applying Breeze Dark theme..."
            kwriteconfig --file ~/.config/kdeglobals --group General --key ColorScheme "BreezeDark"

            # Enable HiDPI support
            echo "Enabling HiDPI support..."
            kwriteconfig --file ~/.config/kcmfonts --group General --key forceFontDPI "144"

            # Restart Plasma Shell to apply changes
            kquitapp6 plasmashell && plasmashell
            ;;
        "GNOME")
            # Additional GNOME optimizations
            echo "Performing GNOME optimizations..."
            # Adjust font rendering for better clarity
            echo "Adjusting font rendering..."
            gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing "rgba"
            gsettings set org.gnome.settings-daemon.plugins.xsettings hinting "slight"
            gsettings set org.gnome.desktop.interface text-scaling-factor 1.2
            ;;
        "Xfce")
            # Additional Xfce optimizations
            echo "Performing Xfce optimizations..."
            # Adjust font rendering for better clarity
            echo "Adjusting font rendering..."
            xfconf-query -c xsettings -p /Gtk/FontName -s "Sans 11"
            xfconf-query -c xsettings -p /Xft/Antialias -s 1
            xfconf-query -c xsettings -p /Xft/Hinting -s 1
            ;;
        "Cinnamon")
            # Additional Cinnamon optimizations
            echo "Performing Cinnamon optimizations..."
            # Adjust font rendering for better clarity
            echo "Adjusting font rendering..."
            gsettings set org.cinnamon.desktop.interface font-antialiasing "rgba"
            gsettings set org.cinnamon.desktop.interface font-hinting "slight"
            ;;
        "MATE")
            # Additional MATE optimizations
            echo "Performing MATE optimizations..."
            # Adjust font rendering for better clarity
            echo "Adjusting font rendering..."
            gsettings set org.mate.interface font-antialiasing "rgba"
            gsettings set org.mate.interface font-hinting "slight"
            ;;
        "LXQt")
            # Additional LXQt optimizations
            echo "Performing LXQt optimizations..."
            # Adjust font rendering for better clarity
            echo "Adjusting font rendering..."
            lxqt-config-file -s /etc/xdg/lxqt/session.conf -g FontRenderingHinting -v slight
            lxqt-config-file -s /etc/xdg/lxqt/session.conf -g FontRenderingAntialiasing -v rgba
            ;;
        "i3")
            # Additional i3 optimizations
            echo "Performing i3 optimizations..."
            # i3 optimizations would typically involve customizing the configuration file
            echo "Customize your i3 configuration for optimization."
            ;;
        *)
            echo "No additional optimizations available for $desktop_environment."
            ;;
    esac
fi


    # Save configuration to a file
    mkdir -p "$HOME/.config/oma"
    echo "desktop_environment=\"$desktop_environment\"" >> "$config_file"
    echo "disk_type=\"$disk_type\"" >> "$config_file"
    echo "aur_helper=\"$aur_helper\"" >> "$config_file"
    echo "purpose=\"$purpose\"" >> "$config_file"
    echo "optimize_purpose=\"$optimize_purpose\"" >> "$config_file"
}

# Function to load configuration from file
load_config() {
    source "$config_file"
}

# Check if configuration file exists
if [ ! -f "$config_file" ]; then
    perform_init
    exit 0
fi

# Load configuration
load_config

# Function to display usage information
display_usage() {
    echo "Usage: OMA [options]"
    echo "Options:"
    echo "  -u, --update              Update system"
    echo "  -r, --remove-packages     Remove unnecessary packages"
    echo "  -c, --clear-cache         Clear package cache"
    echo "  -o, --remove-orphaned     Remove orphaned packages"
    echo "  -d, --disable-services    Disable unnecessary services"
    echo "  -f, --check-filesystem    Check for file system errors"
    echo "  -s, --optimize-swap       Optimize swap usage"
    echo "  -m, --optimize-mount      Optimize file system mount options"
    echo "  -p, --check-duplicates    Check for duplicate files"
    echo "  -t, --monitor-resources   Monitor resource usage"
    echo "  -k, --optimize-desktop    Optimize desktop environment settings"
    echo "  -n, --maintenance         Perform regular maintenance tasks"
    echo "  -h, --help                Display help message for a specific option"
}

# Function to display help message for a specific option
display_option_help() {
    case $1 in
        -u|--update)
            echo "Update system: OMA --update"
            echo "This option updates the system using pacman."
            ;;
        -r|--remove-packages)
            echo "Remove unnecessary packages: OMA --remove-packages"
            echo "This option removes packages that are no longer needed."
            ;;
        -c|--clear-cache)
            echo "Clear package cache: OMA --clear-cache"
            echo "This option clears the package cache to free up disk space."
            ;;
        -o|--remove-orphaned)
            echo "Remove orphaned packages: OMA --remove-orphaned"
            echo "This option removes packages that were installed as dependencies but are no longer required."
            ;;
        -ds|--disable-services)
            echo "Disable unnecessary services: OMA --disable-services"
            echo "This option allows you to disable unnecessary system services."
            echo "Please enter the name of the service you'd like to disable:"
            read -p "Service name: " service_name
            sudo systemctl disable "$service_name"
            ;;
        -cf|--check-filesystem)
            echo "Check file system errors: OMA --check-filesystem"
            echo "This option checks the file system for errors and repairs them if necessary."
            echo "Please enter the file system you'd like to check (e.g., /dev/sda1):"
            read -p "File system: " filesystem
            sudo fsck "$filesystem"
            ;;
        -os|--optimize-swap)
            echo "Optimize swap usage: OMA --optimize-swap"
            echo "This option allows you to optimize swap usage by adjusting the swappiness value."
            echo "Please enter the value for vm.swappiness (0-100):"
            read -p "Swappiness value: " swappiness_value
            sudo sysctl vm.swappiness="$swappiness_value"
            ;;
        -om|--optimize-mount)
            echo "Optimize file system mount options: OMA --optimize-mount"
            echo "This option allows you to optimize file system mount options, such as disabling access time updates."
            echo "Please manually adjust the file system mount options in /etc/fstab."
            ;;
        -p|--check-duplicates)
            echo "Check for duplicate files: OMA --check-duplicates"
            echo "This option checks for duplicate files in a specified directory and prompts for removal."
            echo "Please enter the path to the directory you'd like to check for duplicate files:"
            read -p "Directory path: " directory_path
            fdupes -rdN "$directory_path"
            ;;
        -t|--monitor-resources)
            echo "Monitor resource usage: OMA --monitor-resources"
            echo "This option launches a resource monitoring tool (e.g., htop) to monitor system resources."
            htop
            ;;
        -k|--optimize-desktop)
            echo "Optimize desktop environment settings: OMA --optimize-desktop"
            echo "This option allows you to optimize settings specific to your desktop environment."
            echo "Please manually optimize settings specific to your desktop environment."
            ;;
        -m|--maintenance)
            echo "Perform regular maintenance tasks: OMA --maintenance"
            echo "This option performs regular maintenance tasks, such as system updates and backups."
            echo "Would you like to update the system? (y/n)"
            read -p "Choice: " update_choice
            if [[ $update_choice == "y" ]]; then
                $aur_helper -Syu --noconfirm
            fi
            ;;
        *)
            echo "Invalid option: $1"
            ;;
    esac
}

# Process command-line options
if [[ $# -eq 0 ]]; then
    display_usage
    exit 1
fi

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            shift
            if [[ $# -gt 0 ]]; then
                display_option_help "$1"
            else
                display_usage
            fi
            exit 0
            ;;
        -u|--update)
            echo "Updating system..."
            $aur_helper -Syu --noconfirm
            shift
            ;;
        -i|--install)
            echo "Installing app..."
            read -p "Package: " package_choice
            $aur_helper -S $package_choice
            shift
            ;;
        -s|--search)
            echo "Search app..."
            read -p "Search: " package_choice
            $aur_helper -Ss $package_choice
            read -p "Do you want to install a package? (y/n): " answer_choice
            if [[ $answer_choice == "y" ]]; then
                OMA -i
            fi
            
            shift
            ;;
        -r|--remove-packages)
            echo "Removing unnecessary packages..."
            if $aur_helper -Qdtq >/dev/null 2>&1; then
                $aur_helper -Qdtq | $aur_helper -Rs --noconfirm -
            else
                echo "No unnecessary packages found."
            fi
            shift
            ;;
        -c|--clear-cache)
            echo "Clearing package cache..."
            $aur_helper -Scc --noconfirm
            shift
            ;;
        -o|--remove-orphaned)
            echo "Removing orphaned packages..."
            if $aur_helper -Qdtq >/dev/null 2>&1; then
                $aur_helper -Rns $($aur_helper -Qdtq) --noconfirm
            else
                echo "No orphaned packages found."
            fi
            shift
            ;;
        -ds|--disable-services)
            echo "Disabling unnecessary services..."
            display_option_help "$1"
            shift
            ;;
        -cf|--check-filesystem)
            echo "Checking file system errors..."
            display_option_help "$1"
            shift
            ;;
        -os|--optimize-swap)
            echo "Optimizing swap usage..."
            display_option_help "$1"
            shift
            ;;
        -om|--optimize-mount)
            echo "Optimizing file system mount options..."
            display_option_help "$1"
            shift
            ;;
        -p|--check-duplicates)
            echo "Checking for duplicate files..."
            display_option_help "$1"
            shift
            ;;
        -t|--monitor-resources)
            echo "Monitoring resource usage..."
            display_option_help "$1"
            shift
            ;;
        -k|--optimize-desktop)
            echo "Optimizing desktop environment settings..."
            display_option_help "$1"
            shift
            ;;
        -m|--maintenance)
            echo "Performing regular maintenance tasks..."
            display_option_help "$1"
            shift
            ;;
        *)
            echo "Error: Invalid option: $1"
            display_usage
            exit 1
            ;;
    esac
done

echo "Optimization complete!"
