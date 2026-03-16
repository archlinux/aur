# Maintainer: Barinderpreet Singh <naffydharni006@gmail.com>
#
# Note: namcap warning for qt6 modules can be safely ignored as quickshell
# dependencies will cover those

pkgname=hyprquickframe
pkgver=1.0.0
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

provides=('hyprquickframe')
conflicts=('hyprquickframe')

source=(
    "HyprQuickFrame-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "hyprquickframe"
)

sha256sums=('1d2ce9afc34194cb4ad8348a448f6554800fb949fdcd333fcf558d8060490919'
            '6ecde2b0c6ead2a5f19be7029e75c398fbf834373f6ecf800f72aa99c6901582')

backup=(
    etc/xdg/quickshell/HyprQuickFrame/theme.toml
)

package() {
    # Install Quickshell config (system-wide XDG)
    install -d "$pkgdir/etc/xdg/quickshell"
    cp -r "HyprQuickFrame-$pkgver" "$pkgdir/etc/xdg/quickshell/HyprQuickFrame"
    rm -f "$pkgdir/etc/xdg/quickshell/HyprQuickFrame/"{README.md,flake.nix,flake.lock}

    # Install wrapper script
    install -Dm755 hyprquickframe \
        "$pkgdir/usr/bin/hyprquickframe"
}
