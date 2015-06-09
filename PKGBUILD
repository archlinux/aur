# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-print-bzr
pkgver=r8
pkgrel=1
pkgdesc='A small utility used to print documents that allows the user to set the preferences'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-print'
license=('GPL3')
depends=('contractor' 'gtk3')
makedepends=('bzr' 'cmake' 'vala')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('bzr+lp:pantheon-print')
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  printf "r%s" "$(bzr revno)"
}

build() {
  cd ${pkgname%-*}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd ${pkgname%-*}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
