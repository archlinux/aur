# Mantenedor: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=term-pdf
pkgver=0.0.3.7
pkgrel=1
pkgdesc="TermPDF Viewer is an open-source PDF file viewer designed to run in the terminal."
arch=('x86_64')
url="https://github.com/felipealfonsog/TermPDFViewer"
license=('MIT')
depends=('python-pip' 'python-pymupdf')
source=("https://github.com/felipealfonsog/TermPDFViewer/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('2abb9938cbdf9b54e3dbdee77a0ea11d9aed50729ea5a9d61e5456166d268692')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
  # cp "$srcdir"/term-pdf-wrp.c "$srcdir"/TermPDFViewer-v."$pkgver"/src/
}
build() {
  cd "$srcdir"/TermPDFViewer-v."${pkgver}"
  gcc -o term-pdf-wrp "$srcdir"/TermPDFViewer-v."${pkgver}"/src/term-pdf-wrp.c
}
package() {
  install -Dm755 "$srcdir"/TermPDFViewer-v."${pkgver}"/src/term-pdf-wrp "${pkgdir}/usr/bin/term-pdf"
  install -Dm700 "$srcdir"/TermPDFViewer-v."${pkgver}"/src/termpdf.py "${pkgdir}/$HOME/.config/termpdf.py"
}
