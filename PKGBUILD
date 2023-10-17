# Mantenedor: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=term-pdf
pkgver=0.0.3.5
pkgrel=1
pkgdesc="TermPDF Viewer is an open-source PDF file viewer designed to run in the terminal."
arch=('x86_64')
url="https://github.com/felipealfonsog/TermPDFViewer"
license=('MIT')
depends=('python-pip' 'python-pymupdf')
source=("https://github.com/felipealfonsog/TermPDFViewer/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('19918b1453dea418ed1dc7261e4d72f8af91187a12e145e0b991e46edd77a017')

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
  install -Dm644 "$srcdir"/TermPDFViewer-v."${pkgver}"/src/termpdf.py "${pkgdir}/$HOME/.config/termpdf.py"
}
