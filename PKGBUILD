# Maintainer: Solomon_DbW <s2huncho@gmail.com>
pkgname=sololinux-gui
pkgver=1.0.0
pkgrel=2
pkgdesc="GUI configuration files for SoloLinux (Arch-based distribution)"
arch=('any')
url="https://github.com/Solomon-DbW/SoloLinux_GUI"
license=('MIT')
depends=(
    'hyprland'
    'waybar'
    'rofi'
    'kitty'
    'starship'
    'ttf-jetbrains-mono-nerd'
    'neovim'
    'emacs'
)
optdepends=(
    'ly: Display manager'
    'zathura: PDF viewer'
    'fastfetch: System information tool'
    'hyprpaper: Wallpaper utility'
    'hyprlock: Screen locker'
    'wlogout: Logout menu'
    'swaync: Notification center'
)
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}::git+${url}.git#branch=main")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Install config directories
    install -dm755 "${pkgdir}/etc/skel/.config"
    
    # Copy configuration files
    if [ -d "emacs" ]; then
        cp -r emacs "${pkgdir}/etc/skel/.config/"
    fi
    
    if [ -d "hypr" ]; then
        cp -r hypr "${pkgdir}/etc/skel/.config/"
    fi
    
    if [ -d "kitty" ]; then
        cp -r kitty "${pkgdir}/etc/skel/.config/"
    fi
    
    if [ -d "nvim" ]; then
        cp -r nvim "${pkgdir}/etc/skel/.config/"
    fi
    
    if [ -d "rofi" ]; then
        cp -r rofi "${pkgdir}/etc/skel/.config/"
    fi
    
    if [ -d "waybar" ]; then
        cp -r waybar "${pkgdir}/etc/skel/.config/"
    fi
    
    if [ -d "fastfetch" ]; then
        cp -r fastfetch "${pkgdir}/etc/skel/.config/"
    fi
    
    if [ -f "starship.toml" ]; then
        install -Dm644 starship.toml "${pkgdir}/etc/skel/.config/starship.toml"
    fi
    
    if [ -f "tmuxconffile" ]; then
        install -Dm644 tmuxconffile "${pkgdir}/etc/skel/.tmux.conf"
    fi
    
    if [ -f "zshrcfile" ]; then
        install -Dm644 zshrcfile "${pkgdir}/etc/skel/.zshrc"
    fi
    
    # Install documentation
    if [ -f "README.md" ]; then
        install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    fi
    
    # Install license if it exists
    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
