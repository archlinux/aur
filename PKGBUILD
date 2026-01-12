# Maintainer: Jake <aur2044@jklr.org>

pkgname=dpscreenocr
pkgver=1.5.0
pkgrel=1
pkgdesc="Program to recognize text on screen"
arch=('x86_64')
url='https://danpla.github.io/dpscreenocr'
license=('ZLIB')
install="${pkgname}.install"
depends=('tesseract'
         'qt5-base'
         'hicolor-icon-theme')
makedepends=('cmake'
             'qt5-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/danpla/dpscreenocr/archive/v${pkgver}.tar.gz")
sha256sums=('7d3d7e04f29024d8db956118578a9b3dddc39030f3af08dbc9026cdb57c6a645')

build() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DDPSO_GEN_HTML_MANUAL=NO ..
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm "${pkgdir}/usr/share/doc/${pkgname}/LICENSE.txt"
}
