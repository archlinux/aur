# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=qtwaw
pkgver=1.6.5
pkgrel=1
pkgdesc='An application for WhatsApp Web with tray icon and notifications'
arch=('i686' 'x86_64')
url='https://gitlab.com/scarpetta/qtwaw'
license=('GPL')
depends=('qt5-base' 'qt5-webengine' 'kdbusaddons' 'knotifications')
makedepends=('cmake' 'qt5-tools')
source=("https://gitlab.com/scarpetta/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('25dfd66cece9485fe425b83a349bf5bdd1eeabed6ec91c5046b570e1c07f150e')

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
