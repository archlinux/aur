# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-sound-bzr
pkgver=r8
pkgrel=1
pkgdesc='Sound indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-sound'
license=('GPL3')
groups=('pantheon-unstable')
depends=('wingpanel-rewrite-x11-bzr')
makedepends=('bzr' 'cmake' 'vala')
provides=('wingpanel-indicator-sound')
conflicts=('wingpanel-indicator-sound')
source=('bzr+lp:wingpanel-indicator-sound')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-sound

  echo "r$(bzr revno)"
}

build() {
  cd wingpanel-indicator-sound

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
  cd wingpanel-indicator-sound/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
