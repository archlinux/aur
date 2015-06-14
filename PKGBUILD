# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-session-bzr
pkgver=r18
pkgrel=2
pkgdesc='Session indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-session'
license=('GPL3')
groups=('pantheon-unstable')
depends=('wingpanel-rewrite-x11-bzr')
makedepends=('bzr' 'cmake' 'vala')
provides=('wingpanel-indicator-session')
conflicts=('wingpanel-indicator-session')
source=('bzr+lp:wingpanel-indicator-session')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-session

  echo "r$(bzr revno)"
}

build() {
  cd wingpanel-indicator-session

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd wingpanel-indicator-session/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
