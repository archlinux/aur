# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=term-pdf
pkgver=0.0.3.2
pkgrel=1
pkgdesc="TermPDF Viewer is an open-source PDF file viewer designed to run in the terminal."
arch=('x86_64')
url="https://github.com/felipealfonsog/TermPDFViewer"
license=('MIT')
depends=('python-pip' 'python-pymupdf')

source=("https://github.com/felipealfonsog/TermPDFViewer/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('686cf765766043001b8097e84d872abb4483117191374cc653a246322a95d266')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
  cd "$srcdir"/TermPDFViewer-v."$pkgver"
}

build() {
  # Compile termpdf.py to a binary
  python -m py_compile "$srcdir"/TermPDFViewer-v."${pkgver}"/src/termpdf.py
}

package() {
  # Move the compiled binary to the destination
  install -Dm755 "$srcdir"/TermPDFViewer-v."${pkgver}"/src/__pycache__/termpdf.cpython*.pyc "${pkgdir}/usr/bin/term-pdf"
}
