# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=dpscreenocr
pkgver=1.0.2
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/danpla/dpscreenocr/archive/v1.0.2.tar.gz")
sha256sums=('497e79f05c48ffe5781d2cf524c811ab4f8008842191d1d4b85f87fc4a186ce5')

build() {
  cd "${pkgname}-${pkgver}"
  rm -rf build
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm "${pkgdir}/usr/share/doc/${pkgname}/LICENSE.txt"
}