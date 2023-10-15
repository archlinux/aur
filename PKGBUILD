# Mantenedor: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=term-pdf
pkgver=0.0.3.4
pkgrel=1
pkgdesc="TermPDF Viewer is an open-source PDF file viewer designed to run in the terminal."
arch=('x86_64')
url="https://github.com/felipealfonsog/TermPDFViewer"
license=('MIT')
depends=('gcc' 'python-pip' 'python-pymupdf')

source=("https://github.com/felipealfonsog/TermPDFViewer/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('05c5e6efe954cfe3765f60a94c3c779725c5074b9e33fa1aa4f8d627082494c7')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
  cp "$srcdir"/term-pdf-wrapper.c "$srcdir"/TermPDFViewer-v."$pkgver"/src/
}

build() {
  cd "$srcdir"/TermPDFViewer-v."${pkgver}"

  # Compila tu binario C
  gcc -o term-pdf-wrapper src/term-pdf-wrapper.c
}

package() {
  # Mueve el binario desde src al directorio de destino
  install -Dm755 "$srcdir"/TermPDFViewer-v."${pkgver}"/term-pdf-wrapper "${pkgdir}/usr/bin/term-pdf"
}
