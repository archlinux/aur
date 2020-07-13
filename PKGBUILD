# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=yasw
pkgver=0.5
pkgrel=1
pkgdesc="An application used to correct images taken with a camera"
arch=('x86_64')
url="https://sourceforge.net/projects/yascanw"
license=('GPL3')
depends=('qt4')
makedepends=('qt4' 'doxygen')
source=("${pkgname}-${pkgver}.tgz::https://sourceforge.net/projects/yascanw/files/YASW%20${pkgver}/yasw_${pkgver}.tgz/download")
sha256sums=('a5c6eb08e3ed14d96da89b16c79dcb2d19e2344696b09b3b2f2f3addc98ca65b')

 build() {
  cd "${pkgname}_${pkgver}/src"
  # rm -rf build
  mkdir -p build
  cd build
  qmake-qt4 PREFIX=/usr ..
  make
  cd ../../documentation
  make
}

package() {
  cd "${pkgname}_${pkgver}/src/build"
  install -Dm755 yasw "${pkgdir}/usr/bin/yasw"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -aR ../../documentation/doxygen/html/ "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 ../../changelog.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
}