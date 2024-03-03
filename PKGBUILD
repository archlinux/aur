# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=feather-pdf
pkgver=1.0.2
pkgrel=1
pkgdesc="FeatherPDF is an ultra-lightweight PDF viewer."
arch=('x86_64')
url="https://github.com/felipealfonsog/FeatherPDF"
license=('MIT')
depends=('python' 'python-pip' 'python-pyqt5')

source=("https://github.com/felipealfonsog/FeatherPDF/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('f90e5a2aea0aa0c640299825c695b2392ff49a1d8ac62c9a446fb3af2d2a3aa7')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
}

package() {
  # Install the Python script
  install -Dm755 "$srcdir"/FeatherPDF-v."${pkgver}"/src/featherpdf.py "${pkgdir}/usr/local/bin/feather-pdf.py"
  
  # Create a shell script to execute feather-pdf.py and copy it to /usr/local/bin
  echo '#!/bin/bash' > feather-pdf
  echo 'python3 /usr/local/bin/feather-pdf.py "$@"' >> feather-pdf
  chmod +x feather-pdf
  install -Dm755 feather-pdf "${pkgdir}/usr/local/bin/feather-pdf"

  # Install the icon
  install -Dm644 "$srcdir"/FeatherPDF-v."${pkgver}"/src/fpdf-iconlogo.png "${pkgdir}/usr/share/pixmaps/feather-pdf.png"

  # Install the .desktop file
  install -Dm644 "$srcdir"/FeatherPDF-v."${pkgver}"/src/feather-pdf.desktop "${pkgdir}/usr/share/applications/feather-pdf.desktop"
}

