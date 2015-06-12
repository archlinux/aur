# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Grabli66 <https://launchpad.net/~grabli66-r>

pkgname=currency-bzr
pkgver=r39
pkgrel=1
pkgdesc='Currency converter developed for Elementary OS desktop.'
arch=('i686' 'x86_64')
url='https://code.launchpad.net/~grabli66-r/+junk/currency'
license=('GPL3')
depends=('gtk3' 'libsoup' 'glib2' 'libgee' 'json-glib' 'glib-networking')
optdepends=()
makedepends=('vala' 'bzr' 'cmake')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
install="${pkgname%-*}.install"
source=('bzr+lp:~grabli66-r/+junk/currency')
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
