# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-keyboard
pkgver=2.0.2
pkgrel=1
pkgdesc='Wingpanel Keyboard Indicator'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel-indicator-keyboard'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3' 'libxml2'
         'libwingpanel-2.0.so')
makedepends=('cmake' 'vala' 'wingpanel')
source=("wingpanel-indicator-keyboard-${pkgver}.tar.gz::https://github.com/elementary/wingpanel-indicator-keyboard/archive/${pkgver}.tar.gz")
sha256sums=('c42b8a27326ff3034b2d852eba422f8c6ca21b131a98e43a66ef04ce7d40e868')

prepare() {
  cd wingpanel-indicator-keyboard-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-keyboard-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd wingpanel-indicator-keyboard-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
