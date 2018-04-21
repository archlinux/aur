# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Siddhartha Das <https://github.com/babluboy, bablu.boy@gmail.com>

pkgname=nutty-git
pkgver=82.6877a87
pkgrel=1
_gitname=nutty
pkgdesc='A network utility for linux. Monitor the devices on your network and check bandwidth and speed details.'
arch=('i686' 'x86_64')
url='https://github.com/babluboy/nutty'
license=('GPL3')
depends=('gtk3' 'granite' 'sqlite' 'libxml2' 'libnotify' 'libgee')
optdepends=()
makedepends=('vala' 'git' 'cmake')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
install="${pkgname%-*}.install"
source=('git+https://github.com/babluboy/nutty.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $_gitname/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
