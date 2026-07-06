# Maintainer: Arunachalam (Tamil Nadu, India) <arunachalamthehacker@gmail.com>
pkgname=luna-hyprdots
pkgver=r1.d3fe1bb
pkgrel=1
pkgdesc="Arunachalam's Modern Minimalist Hyprland Rice for Arch Linux. Optimized for the Tamil Nadu developer ecosystem."
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/luna-hyprdots"
license=('GPL3')
depends=(
    'hyprland' 'hyprlock' 'hyprpaper' 'hyprcursor' 'kitty' 'zsh' 'starship'
    'sddm' 'fastfetch' 'btop' 'bat' 'bc' 'figlet' 'git' 'p7zip' 'wl-clipboard'
    'lsd' 'cron' 'socat' 'dart-sass' 'sassc' 'fd' 'jq' 'translate-shell'
    'python-requests' 'python-pillow' 'zsh-syntax-highlighting' 'bluez'
    'bluez-utils' 'network-manager-applet' 'networkmanager' 'pamixer'
    'pavucontrol' 'playerctl' 'pipewire' 'brightnessctl' 'swayimg' 'grim'
    'wf-recorder' 'vlc' 'imagemagick' 'mpvpaper' 'zenity' 'gtk4' 'libadwaita'
    'gnome-themes-extra' 'gvfs' 'ttf-jetbrains-mono-nerd' 'noto-fonts-emoji'
    'kvantum' 'qt5ct'
)
optdepends=(
    'aylurs-gtk-shell-git: Required for the bar and widgets'
    'libastal-meta: For AGS widgets'
    'zsh-auto-notify: ZSH notifications'
    'swww: Dynamic wallpapers'
    'swappy: Screenshot editor'
    'cava: Audio visualizer'
    'matugen-bin: Material You color generation'
    'hyprpicker: Color picker'
    'hyprpolkitagent: Polkit authentication agent'
)
makedepends=('git')
source=("${pkgname}::git+https://github.com/Arunachalam-gojosaturo/luna-hyprdots.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    
    # Install the dotfiles into /usr/share/luna-hyprdots
    install -d "${pkgdir}/usr/share/${pkgname%-git}"
    cp -r .config "${pkgdir}/usr/share/${pkgname%-git}/"
    cp -r .icons "${pkgdir}/usr/share/${pkgname%-git}/"
    cp .zshrc "${pkgdir}/usr/share/${pkgname%-git}/"
    
    # Install documentation
    install -d "${pkgdir}/usr/share/doc/${pkgname%-git}"
    cp -r DOCUMENTATION/* "${pkgdir}/usr/share/doc/${pkgname%-git}/"
    
    # Optionally, we can also provide the install.sh script as a helper
    install -Dm755 install.sh "${pkgdir}/usr/share/${pkgname%-git}/install.sh"
    
    # Note for users
    install -d "${pkgdir}/usr/share/doc/${pkgname%-git}"
    echo "To use these dotfiles, copy the contents of /usr/share/${pkgname%-git}/ to your home directory." > "${pkgdir}/usr/share/doc/${pkgname%-git}/README-AUR.txt"
}
