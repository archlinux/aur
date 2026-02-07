# Maintainer: Barinderpreet Singh <naffydharni006@gmail.com>
#
# Note: namcap warning for qt6 modules can be safely ignored as quickshell
# dependencies will cover those

pkgname=quicksnip-git
pkgver=r33.g7768491
pkgrel=1
pkgdesc="Quickshell-based Google Lens and OCR utility for Hyprland"
arch=('any')
url="https://github.com/Ronin-CK/QuickSnip"
license=('MIT')

depends=(
    'quickshell'
    'tesseract'
    'tesseract-data-eng'
    'curl'
    'grim'
    'imagemagick'
    'wl-clipboard'
    'satty'
    'libnotify'
)

makedepends=('git')

provides=('quicksnip')
conflicts=('quicksnip')

source=(
    "QuickSnip::git+$url.git"
    "quicksnip"
)

sha256sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd QuickSnip
    printf "r%s.g%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

package() {
    # Install license
    install -Dm644 QuickSnip/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install Quickshell config (system-wide XDG)
    install -d "$pkgdir/etc/xdg/quickshell/QuickSnip"

    install -m644 QuickSnip/dimming.frag.qsb \
        "$pkgdir/etc/xdg/quickshell/QuickSnip/"

    install -m644 \
        QuickSnip/FreezeScreen.qml \
        QuickSnip/RegionSelector.qml \
        QuickSnip/shell.qml \
        "$pkgdir/etc/xdg/quickshell/QuickSnip/"

    # Install wrapper script
    install -Dm755 quicksnip \
        "$pkgdir/usr/bin/quicksnip"
}
