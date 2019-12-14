# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=qtwaw
pkgver=1.5
pkgrel=1
pkgdesc='An application for WhatsApp Web with tray icon and notifications'
arch=('i686' 'x86_64')
url='https://gitlab.com/scarpetta/qtwaw'
license=('GPL')
depends=('qt5-base' 'qt5-webengine' 'kdbusaddons' 'knotifications')
makedepends=('cmake' 'qt5-tools')
source=("https://gitlab.com/scarpetta/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('8d2f177945fa2581b3bc71093278f32f805589cc3a2846a13a8a9f599db6b757')

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
