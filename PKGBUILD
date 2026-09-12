# Maintainer: Nelson Duarte <nelsonduarte@github.com>
pkgname=pdfapps-bin
_pkgname=pdfapps
pkgver=1.15.0
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
    '99e2e959aea8cf6028e50d65ce4e3c9f0d7779fb22f75a24bbbe470c558e8491'
    '7db363c32a832c173e807e3737b50425dd2554acf93b25715a68483c4ff68c51'
    '0d7610911a09ee9c5ff3770de433bc61c31d81825ff433e8c42e46eedc6324b5'
    'fc164eeed90d4f8f0898b79048626c3bdc3637ba011ba3aaf3b6249265ff6823'
    '79800a6233787dc82b3ea31c7de75be10149e387d1180029ec14e59301663c77'
    '97d82b76f38a287d8eaaee1f295ed3848052f35855439a44f57197854ac20361'
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
