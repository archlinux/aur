# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('yasw' 'yasw-docs')
pkgver=0.5
pkgrel=1
pkgdesc="An application used to correct images taken with a camera"
arch=('x86_64')
url="https://sourceforge.net/projects/yascanw"
license=('GPL3')
makedepends=('qt4' 'doxygen')
source=("yasw-${pkgver}.tgz::https://sourceforge.net/projects/yascanw/files/YASW%20${pkgver}/yasw_${pkgver}.tgz/download")
sha256sums=('a5c6eb08e3ed14d96da89b16c79dcb2d19e2344696b09b3b2f2f3addc98ca65b')

 build() {
  cd "yasw_${pkgver}/src"
  rm -rf build
  mkdir -p build
  cd build
  qmake-qt4 PREFIX=/usr ..
  make
  cd ../../documentation
  make
}

package_yasw() {
  pkgdesc="An application used to correct images taken with a camera"
  arch=('x86_64')
  depends=('qt4')
  cd "yasw_${pkgver}/src/build"
  install -Dm755 yasw "${pkgdir}/usr/bin/yasw"
  install -Dm644 ../../changelog.txt -t "${pkgdir}/usr/share/doc/yasw"
}

package_yasw-docs() {
  pkgdesc="Source code documentation for YASW (Yet Another Scan Wizard)"
  arch=('any')
  cd "yasw_${pkgver}"
  install -d "${pkgdir}/usr/share/doc/yasw-docs"
  cp -aR documentation/doxygen/html/ "${pkgdir}/usr/share/doc/yasw-docs"
}