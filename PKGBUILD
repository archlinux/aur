# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-datetime-bzr
pkgver=r78
pkgrel=1
pkgdesc='Date & Time indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-datetime'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('wingpanel-indicator-datetime')
conflicts=('wingpanel-indicator-datetime')
source=('bzr+lp:wingpanel-indicator-datetime')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-datetime

  echo "r$(bzr revno)"
}

prepare() {
  cd wingpanel-indicator-datetime

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-datetime/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd wingpanel-indicator-datetime/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
