# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=qtwaw
pkgver=1.2
pkgrel=1
pkgdesc='An application for WhatsApp Web with tray icon and notifications'
arch=('i686' 'x86_64')
url='https://gitlab.com/scarpetta/qtwaw'
license=('GPL')
depends=('qt5-webengine')
makedepends=('cmake' 'qt5-tools')
source=("https://gitlab.com/scarpetta/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('57f1e8c0373beabadaed6e79dc0705cb9ea5eaddc0471ea31ef452ce3a09c43f')

prepare() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  mkdir -p build
}

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}/build"
  make DESTDIR="$pkgdir" install
}
