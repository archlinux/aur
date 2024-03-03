# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=feather-pdf
pkgver=1.0.1
pkgrel=1
pkgdesc="FeatherPDF is an ultra-lightweight PDF viewer."
arch=('x86_64')
url="https://github.com/felipealfonsog/FeatherPDF"
license=('MIT')
depends=('python' 'python-pip' 'python-pyqt5')

source=("https://github.com/felipealfonsog/FeatherPDF/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('3e48de8a0168c4a69b58e8a8020b3e495939da2202ef625dcaece15613df3f1a')

prepare() {
  tar xf "v${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
}

package() {
  # Install the Python script
  install -Dm755 "$srcdir"/FeatherPDF-v"${pkgver}"/src/featherpdf.py "${pkgdir}/usr/local/bin/feather-pdf.py"
  
  # Create a shell script to execute feather-pdf.py and copy it to /usr/local/bin
  echo '#!/bin/bash' > feather-pdf
  echo 'python3 /usr/local/bin/feather-pdf.py "$@"' >> feather-pdf
  chmod +x feather-pdf
  install -Dm755 feather-pdf "${pkgdir}/usr/local/bin/feather-pdf"

  # Install the icon
  install -Dm644 "$srcdir"/FeatherPDF-v"${pkgver}"/src/fpdf-iconlogo.png "${pkgdir}/usr/share/pixmaps/feather-pdf.png"

  # Install the .desktop file
  install -Dm644 "$srcdir"/feather-pdf.desktop "${pkgdir}/usr/share/applications/feather-pdf.desktop"
}

