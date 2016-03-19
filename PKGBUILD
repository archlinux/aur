# Based on a PKGBUILD by Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-notifications-bzr
pkgver=r75
pkgrel=1
pkgdesc='Notifications indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-notifications'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glibc' 'gtk3' 
         'libwingpanel-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('wingpanel-indicator-notifications')
conflicts=('wingpanel-indicator-notifications')
source=('bzr+lp:wingpanel-indicator-notifications')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-notifications

  echo "r$(bzr revno)"
}

prepare() {
  cd wingpanel-indicator-notifications

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-notifications/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd wingpanel-indicator-notifications/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
