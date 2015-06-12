# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Djax <https://launchpad.net/~parnold-x>

pkgname=nasc-bzr
pkgver=r35
pkgrel=1
pkgdesc='Do maths like a normal person.'
arch=('i686' 'x86_64')
url='http://parnold-x.github.io/nasc/'
license=('GPL3')
depends=('gtk3' 'libqalculate' 'granite' 'glib2' 'libgee' 'gtksourceview3' 'libsoup')
optdepends=()
makedepends=('vala' 'bzr')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
install="${pkgname%-*}.install"
source=('bzr+lp:nasc')
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
