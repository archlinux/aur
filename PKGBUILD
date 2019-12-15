# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=qtwaw
pkgver=1.6
pkgrel=1
pkgdesc='An application for WhatsApp Web with tray icon and notifications'
arch=('i686' 'x86_64')
url='https://gitlab.com/scarpetta/qtwaw'
license=('GPL')
depends=('qt5-base' 'qt5-webengine' 'kdbusaddons' 'knotifications')
makedepends=('cmake' 'qt5-tools')
source=("https://gitlab.com/scarpetta/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('37d75c5b50c583de7155212c49db45cf7db4904839bf5f8136f061eb570269a1')

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
