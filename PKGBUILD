# Maintainer: Nelson Duarte <nelsonduarte@github.com>
pkgname=pdfapps-bin
_pkgname=pdfapps
pkgver=1.8.3
pkgrel=1
pkgdesc="Fast, offline, subscription-free PDF editor (PyInstaller binary)"
arch=('x86_64')
url="https://nelsonduarte.github.io/PDFApps/"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=(
    'glibc'
    'fontconfig'
    'libxcb'
    'libxkbcommon'
)
optdepends=(
    'tesseract: OCR text recognition'
    'tesseract-data-eng: English OCR'
    'tesseract-data-por: Portuguese OCR'
    'tesseract-data-spa: Spanish OCR'
    'tesseract-data-fra: French OCR'
    'tesseract-data-deu: German OCR'
    'ghostscript: advanced PDF compression'
)
source=(
    "$_pkgname-$pkgver.tar.gz::https://github.com/nelsonduarte/PDFApps/releases/download/v$pkgver/PDFApps-Linux.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/nelsonduarte/PDFApps/v$pkgver/LICENSE"
    "$_pkgname.desktop::https://raw.githubusercontent.com/nelsonduarte/PDFApps/v$pkgver/flatpak/io.github.nelsonduarte.PDFApps.desktop"
    "$_pkgname.metainfo.xml::https://raw.githubusercontent.com/nelsonduarte/PDFApps/v$pkgver/flatpak/io.github.nelsonduarte.PDFApps.metainfo.xml"
    "$_pkgname.png::https://raw.githubusercontent.com/nelsonduarte/PDFApps/v$pkgver/icon_512.png"
    "$_pkgname.svg::https://raw.githubusercontent.com/nelsonduarte/PDFApps/v$pkgver/pdfapps.svg"
)
sha256sums=(
    'fb1a17917ba863fd95343dca51c6ef9ea7285a8d6d33ea33088b63940d2ec2c2'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

package() {
    # Install the bundled binary
    install -Dm755 "$srcdir/PDFApps" "$pkgdir/opt/$_pkgname/PDFApps"

    # Launcher symlink in /usr/bin
    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/PDFApps" "$pkgdir/usr/bin/$_pkgname"

    # Desktop file (must reference the launcher we created)
    install -Dm644 "$srcdir/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/io.github.nelsonduarte.PDFApps.desktop"

    # AppStream metainfo
    install -Dm644 "$srcdir/$_pkgname.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/io.github.nelsonduarte.PDFApps.metainfo.xml"

    # Icons
    install -Dm644 "$srcdir/$_pkgname.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.nelsonduarte.PDFApps.png"
    install -Dm644 "$srcdir/$_pkgname.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.nelsonduarte.PDFApps.svg"

    # License
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
