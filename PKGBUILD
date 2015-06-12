# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Kiran Hampal

pkgname=taxi-bzr
pkgver=r142
pkgrel=1
pkgdesc='A simple to use FTP client, designed for elementary OS.'
arch=('i686' 'x86_64')
url='https://launchpad.net/taxi'
license=('GPL3')
depends=('granite' 'gtk3')
makedepends=('bzr' 'vala' 'cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=('bzr+lp:taxi')
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
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${pkgname%-*}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
