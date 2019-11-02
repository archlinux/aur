# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=qtwaw
pkgver=1.0
pkgrel=1
pkgdesc='An application for WhatsApp Web with tray icon and notifications'
arch=('i686' 'x86_64')
url='https://gitlab.com/scarpetta/qtwaw'
license=('GPL')
depends=('qt5-webengine')
makedepends=('cmake' 'qt5-tools')
source=("https://gitlab.com/scarpetta/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('b29ee8b090aa9eb2d8e44ba63e1938d3b994f824882ba9e97d12cb8cb8a8945bd078c1b5aba2c5bfe45e9729e6c1e69ee442c94c3692786672866b070c5d7b55')

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
