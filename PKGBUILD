# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Luiz Augusto Morais <https://launchpad.net/~luizaugustomm>

pkgname=tomatoapp-bzr
pkgver=r62
pkgrel=1
pkgdesc='A simple pomodoro app designed for Elementary OS.'
arch=('i686' 'x86_64')
url='https://launchpad.net/tomatoapp'
license=('GPL3')
depends=('gtk3' 'libnotify' 'granite' 'libunity')
optdepends=()
makedepends=('vala' 'bzr' 'cmake')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
install="${pkgname%-*}.install"
source=('bzr+lp:tomatoapp')
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
