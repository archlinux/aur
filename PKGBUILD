# Maintainer: Your Name <your.email@example.com>
pkgname=circle-to-search
pkgver=1.2.2
pkgrel=1
pkgdesc="Draw to select, search with Google Lens - Linux Wayland edition"
arch=('any')
url="https://github.com/jaslrobinson/circle-to-search"
license=('MIT')
depends=(
    'python'
    'python-pillow'
    'python-gobject'
    'gtk3'
    'wl-clipboard'
)
optdepends=(
    'grim: screenshot support for wlroots compositors (Hyprland, Sway)'
    'spectacle: screenshot support for KDE Plasma'
    'tesseract: OCR text extraction'
    'tesseract-data-eng: English language data for OCR'
    'python-pytesseract: Python bindings for tesseract'
    'gtk-layer-shell: live mode support (Hyprland/Sway only)'
)
# Note: GNOME 42+ uses built-in D-Bus Screenshot API (no extra packages needed)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install main script
    install -Dm755 circle-to-search.py "$pkgdir/usr/bin/circle-to-search"

    # Install icon
    install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/circle-to-search.png"

    # Install desktop file
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/circle-to-search.desktop" <<EOF
[Desktop Entry]
Name=Circle to Search
Comment=Draw to select, search with Google Lens
Exec=circle-to-search
Icon=circle-to-search
Terminal=false
Type=Application
Categories=Utility;Graphics;
Keywords=screenshot;search;lens;ocr;
EOF

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
