# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Nicolas Laplante <https://launchpad.net/~nicolas-laplante>

pkgname=envelope-git
pkgver=386.97c1a25
pkgrel=1
_gitname=envelope
pkgdesc='Personal budget application for the Elementary OS desktop'
arch=('i686' 'x86_64')
url='http://nlaplante.github.io/envelope/'
license=('GPL3')
depends=('granite' 'gtk3' 'libgee' 'glib2' 'glib-networking' 'sqlheavy')
makedepends=('git' 'vala' 'cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=('git+https://github.com/nlaplante/envelope.git')
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
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ..
  make
}

package() {
  cd $_gitname/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et: