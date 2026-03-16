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

sha256sums=(
    '1d2ce9afc34194cb4ad8348a448f6554800fb949fdcd333fcf558d8060490919'
    'c1e3e50cc42afdf4792ff2b290a41bf62c2422cc98c8ec43ab265bb8c7e09226'
)

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
