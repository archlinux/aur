# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-gcc-bzr
pkgver=r18
pkgrel=1
pkgdesc='GNOME Control Center plug for Switchboard'
arch=('i686' 'x86_64')
url='https://code.launchpad.net/~elementary-apps/pantheon-plugs/dynamic-gcc-plug-isis'
license=('GPL3')
depends=('libgnome-control-center' 'switchboard-bzr')
makedepends=('bzr' 'cmake' 'vala')
provides=("${pkgname}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::bzr+lp:pantheon-plugs/dynamic-isis")
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

  cmake .. -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd ${pkgname%-*}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
