# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Manuel Kehl <https://launchpad.net/~mank319, https://github.com/mank319/>

pkgname=go-for-it-bzr
pkgver=r101
pkgrel=1
pkgdesc='A stylish to-do list with built-in productivity timer.'
arch=('i686' 'x86_64')
url='https://code.launchpad.net/~mank319/+junk/go-for-it'
license=('GPL3')
depends=('gtk3' 'libnotify')
optdepends=()
makedepends=('vala' 'bzr' 'cmake')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
install="${pkgname%-*}.install"
source=('bzr+lp:~mank319/+junk/go-for-it')
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
