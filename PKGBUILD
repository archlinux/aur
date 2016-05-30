# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-calculator-bzr
pkgver=r227
pkgrel=1
pkgdesc='The Pantheon Calculator'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-calculator'
license=('GPL3')
groups=('pantheon-unstable')
depends=('libgranite.so')
makedepends=('bzr' 'cmake' 'granite-bzr' 'intltool' 'vala')
provides=('pantheon-calculator')
conflicts=('pantheon-calculator')
source=('bzr+lp:pantheon-calculator')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-calculator

  echo "r$(bzr revno)"
}

build() {
  cd pantheon-calculator

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd pantheon-calculator/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
