# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-network-bzr
pkgver=r21
pkgrel=1
pkgdesc='Network indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-network'
license=('GPL3')
groups=('pantheon-unstable')
depends=('wingpanel-rewrite-x11-bzr')
makedepends=('bzr' 'cmake' 'libnm-gtk' 'vala')
provides=('wingpanel-indicator-network')
conflicts=('wingpanel-indicator-network')
install='wingpanel-indicator-network.install'
source=('bzr+lp:wingpanel-indicator-network')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-network

  echo "r$(bzr revno)"
}

build() {
  cd wingpanel-indicator-network

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd wingpanel-indicator-network/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
