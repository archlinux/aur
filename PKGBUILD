# Based on a PKGBUILD by Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-agent-polkit-bzr
pkgver=r75
pkgrel=1
pkgdesc='An agent for Polkit authorization designed for Pantheon'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-agent-polkit'
license=('GPL3')
groups=('pantheon-unstable')
depends=('polkit' 'gtk3')
makedepends=('bzr' 'cmake' 'vala' 'cmake-elementary-bzr')
provides=('pantheon-agent-polkit')
conflicts=('pantheon-agent-polkit')
source=('bzr+lp:pantheon-agent-polkit')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-agent-polkit

  echo "r$(bzr revno)"
}

build() {
  cd pantheon-agent-polkit

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE' \
    -DUSE_UNITY='FALSE'
  make
}

package() {
  cd pantheon-agent-polkit/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
