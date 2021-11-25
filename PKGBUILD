# Maintainer: carlosfritz <carlosfritz@posteo.net>

_gitname=peripheral.joystick
pkgname=kodi-addon-peripheral-joystick-git
pkgver=r912.2786720
pkgrel=1
pkgdesc="Joystick support for Kodi"
url='https://github.com/xbmc/peripheral.joystick'
license=('GPL2')
source=("${_gitname}::git+https://github.com/xbmc/peripheral.joystick.git")
sha256sums=('SKIP')
arch=('any')
depends=('kodi' 'p8-platform')
makedepends=('git' 'cmake' 'kodi-platform' 'kodi-dev')
conflicts=('kodi-addon-peripheral-joystick')
provides=('kodi-addon-peripheral-joystick')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  cmake \
    -DADDONS_TO_BUILD=peripheral.joystick \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_MODULE_PATH=/usr/lib/kodi
}

package() {
  cd "${srcdir}/${_gitname}"
  make prefix=/usr DESTDIR="$pkgdir" install
}
