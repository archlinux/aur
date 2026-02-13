# Maintainer: Barinderpreet Singh <naffydharni006@gmail.com>
#
# Note: namcap warning for qt6 modules can be safely ignored as quickshell
# dependencies will cover those

pkgname=hyprquickframe-git
pkgver=r29.g8e052c6
pkgrel=3
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
        HyprQuickFrame/Theme.qml \
        HyprQuickFrame/QuickToggle.qml \
        HyprQuickFrame/shell.qml \
        "$pkgdir/etc/xdg/quickshell/HyprQuickFrame/"

    # Theme configuration
    install -m644 HyprQuickFrame/theme.toml \
        "$pkgdir/etc/xdg/quickshell/HyprQuickFrame/"

    # Install wrapper script
    install -Dm755 hyprquickframe \
        "$pkgdir/usr/bin/hyprquickframe"
}
