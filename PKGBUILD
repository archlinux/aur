# Maintainer: Jake <aur@ja-ke.tech>

pkgname=dpscreenocr
pkgver=1.4.0
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
sha256sums=('5d1569c418943014d1dce1eb8336fef490f1534d032d1bd26ffbcd9e31a214c6')

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
