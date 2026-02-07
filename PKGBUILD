# Maintainer: Barinderpreet Singh <naffydharni006@gmail.com>
#
# Note: namcap warning for qt6 modules can be safely ignored as quickshell
# dependencies will cover those

pkgname=hyprquickframe-git
pkgver=r41.g0471d6e
pkgrel=2
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

package() {
    # Install license
    install -Dm644 HyprQuickFrame/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install Quickshell config (system-wide XDG)
    install -d "$pkgdir/etc/xdg/quickshell/HyprQuickFrame"

    install -m644 HyprQuickFrame/dimming.frag.qsb \
        "$pkgdir/etc/xdg/quickshell/HyprQuickFrame/"

    install -m644 \
        HyprQuickFrame/FreezeScreen.qml \
        HyprQuickFrame/RegionSelector.qml \
        HyprQuickFrame/WindowSelector.qml \
        HyprQuickFrame/shell.qml \
        "$pkgdir/etc/xdg/quickshell/HyprQuickFrame/"

    # Install wrapper script
    install -Dm755 hyprquickframe \
        "$pkgdir/usr/bin/hyprquickframe"
}
