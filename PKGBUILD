# Maintainer: Barinderpreet Singh <naffydharni006@gmail.com>
#
# Note: namcap warning for qt6 modules can be safely ignored as quickshell
# dependencies will cover those

pkgname=hyprquickframe-git
pkgver=r53.g8a924b6
pkgrel=1
pkgdesc="Quickshell-based screenshot utility for Hyprland"
arch=('any')
url="https://github.com/Ronin-CK/HyprQuickFrame"
license=('MIT')

depends=(
    'quickshell'
    'grim'
    'imagemagick'
    'wl-clipboard'
    'satty'
    'libnotify'
)

makedepends=('git')

provides=('hyprquickframe')
conflicts=('hyprquickframe')

source=(
    "HyprQuickFrame::git+$url.git"
    "hyprquickframe"
)

sha256sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd HyprQuickFrame
    printf "r%s.g%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

backup=(
    etc/xdg/quickshell/HyprQuickFrame/theme.toml
)

package() {
    # Install Quickshell config (system-wide XDG)
    install -d "$pkgdir/etc/xdg/quickshell"
    cp -r HyprQuickFrame "$pkgdir/etc/xdg/quickshell/HyprQuickFrame"
    rm -f "$pkgdir/etc/xdg/quickshell/HyprQuickFrame/"{README.md,flake.nix,flake.lock}

    # Install wrapper script
    install -Dm755 hyprquickframe \
        "$pkgdir/usr/bin/hyprquickframe"
}
