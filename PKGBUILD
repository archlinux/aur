# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-datetime
pkgver=2.0
pkgrel=1
pkgdesc='Date & Time indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-datetime'
license=('GPL3')
groups=('pantheon')
depends=('cairo' 'evolution-data-server' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libical'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/wingpanel-indicator-datetime/loki/${pkgver}/+download/wingpanel-indicator-datetime-${pkgver}.tar.xz")
sha256sums=('61e9337a72790f61a2fedc6f15ac8a83be0a5de48138fd627d5e5f15e349fc44')

prepare() {
  cd wingpanel-indicator-datetime-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-datetime-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd wingpanel-indicator-datetime-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
