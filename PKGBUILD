# Mantenedor: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=term-pdf
pkgver=0.0.4.5
pkgrel=1
pkgdesc="TermPDF Viewer is an open-source PDF file viewer designed to run in the terminal."
arch=('x86_64')
url="https://github.com/felipealfonsog/TermPDFViewer"
license=('MIT')
depends=('gcc' 'python-pip' 'python-pymupdf' 'python-termcolor')
source=("https://github.com/felipealfonsog/TermPDFViewer/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('a7da1cbb677b87122c6dd252de83e8f8088ec9d4a443ce83c1cff3ac9f3b592a')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
}

package() {
  # Install the Python script
  install -Dm755 "$srcdir"/TermPDFViewer-v."${pkgver}"/src/termpdf.py "${pkgdir}/usr/local/bin/term-pdf.py"
  
  # Create a shell script to execute term-pdf.py and copy it to /usr/local/bin
  echo '#!/bin/bash' > term-pdf
  echo 'python /usr/local/bin/term-pdf.py "$@"' >> term-pdf
  chmod +x term-pdf
  install -Dm755 term-pdf "${pkgdir}/usr/local/bin/term-pdf"
}

