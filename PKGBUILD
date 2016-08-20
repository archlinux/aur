# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-keyboard
pkgver=2.0
pkgrel=1
pkgdesc='Keyboard indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-keyboard'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/wingpanel-indicator-keyboard/loki/${pkgver}/+download/wingpanel-indicator-keyboard-${pkgver}.tar.xz")
sha256sums=('1539fbc3a921b97154e84aeb180b8508e8ff3dd47b0be2be24b4e6fb358c69e2')

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
