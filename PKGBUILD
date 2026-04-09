# Maintainer: 5h4d0wn1k <https://github.com/5h4d0wn1k>

pkgname=wallpaper-picker
pkgver=2.2.0
pkgrel=1
pkgdesc="A sleek, feature-rich video wallpaper manager for Hyprland/Wayland"
arch=('any')
url="https://github.com/5h4d0wn1k/wallpaper-picker"
license=('MIT')
depends=(
    'bash>=4.0'
    'mpvpaper'
    'fzf'
    'mpv'
    'jq'
)
optdepends=(
    'gtk4: For modern GTK4 GUI'
    'libadwaita: For Adwaita styling'
    'python-gobject: For GUI support'
    'ffmpeg: For video thumbnails'
    'libnotify: Desktop notifications'
    'pywal: For colorscheme generation'
)
provides=('wallpaper-picker')
conflicts=('wallpaper-picker-git')
install="${pkgname}.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    chmod +x src/wallpaper-picker src/wallpaper-picker-gui
}

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm755 src/wallpaper-picker "${pkgdir}/usr/bin/wallpaper-picker"
    install -Dm755 src/wallpaper-picker-gui "${pkgdir}/usr/bin/wallpaper-picker-gui"
    
    install -Dm644 desktop/wallpaper-picker.desktop \
        "${pkgdir}/usr/share/applications/wallpaper-picker.desktop"
    
    install -Dm644 icons/wallpaper-picker.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wallpaper-picker.svg"
    install -Dm644 icons/wallpaper-picker.svg \
        "${pkgdir}/usr/share/pixmaps/wallpaper-picker.svg"
    
    gzip -c wallpaper-picker.1 > "${pkgdir}/usr/share/man/man1/wallpaper-picker.1.gz"
    
    install -Dm644 completions/bash/wallpaper-picker \
        "${pkgdir}/usr/share/bash-completion/completions/wallpaper-picker"
    install -Dm644 completions/zsh/_wallpaper-picker \
        "${pkgdir}/usr/share/zsh/site-functions/_wallpaper-picker"
    install -Dm644 completions/fish/wallpaper-picker.fish \
        "${pkgdir}/usr/share/fish/vendor_completions.d/wallpaper-picker.fish"
    
    install -Dm644 systemd/wallpaper-picker.service \
        "${pkgdir}/usr/lib/systemd/user/wallpaper-picker.service"
    
    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md \
        "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
