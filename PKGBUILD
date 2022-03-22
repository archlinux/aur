# Maintainer: Sergey Kostyaev <feo.me@ya.ru>
pkgname=freelib-git
pkgver=6.0.18
pkgrel=1
epoch=
pkgdesc="Freelib is book library manager."
arch=('i686' 'x86_64')
url="https://github.com/petrovvlad/freeLib"
license=('GPL')
groups=()
depends=('qt5-base' 'qt5-webengine' 'qt5-xmlpatterns' 'quazip-qt5')
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=("$pkgname")
conflicts=("freelib")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/petrovvlad/freeLib.git")
noextract=()
md5sums=('SKIP')

prepare() {
  cd "$srcdir/freeLib"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/freeLib"
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DQUAZIP_STATIC:BOOL=ON .. && cmake --build .
}

package() {
  cd "$srcdir/freeLib/build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
