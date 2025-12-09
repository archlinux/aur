# Maintainer: Jasl Robinson <jaslrobinson@gmail.com>
pkgname=circle-to-search
pkgver=1.1.0
pkgrel=1
pkgdesc="Circle to Search for Linux - Draw a selection on your screen, search with Google Lens or extract text via OCR"
arch=('any')
url="https://github.com/jaslrobinson/circle-to-search"
license=('MIT')
depends=(
    'python'
    'python-pillow'
    'python-gobject'
    'gtk3'
    'grim'
    'wl-clipboard'
)
optdepends=(
    'tesseract: OCR text extraction'
    'tesseract-data-eng: English OCR language data'
    'python-pytesseract: Python bindings for tesseract'
    'gtk-layer-shell: Live mode support (Hyprland/Sway)'
    'python-numpy: Edge detection support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('71ab81f4e1dd015576121d4c0f19867cb0f1883399757d6138c99f3575c3063c')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install main script
    install -Dm755 circle-to-search.py "$pkgdir/usr/bin/circle-to-search"

    # Install icon
    install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/circle-to-search.png"
    install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/circle-to-search.svg"

    # Install desktop file
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/circle-to-search.desktop" <<EOF
[Desktop Entry]
Name=Circle to Search
Comment=Draw a selection on your screen and search with Google Lens
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
