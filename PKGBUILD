# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=chewing-editor-git
pkgver=0.1.1.r37.g9f25170
pkgrel=2
pkgdesc="Cross platform chewing user phrase editor"
arch=('i686' 'x86_64')
url="http://chewing.im"
license=('GPL')
depends=('glibc' 'libchewing' 'qt5-base' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'qt5-tools' 'help2man')
checkdepends=('valgrind')
provides=('chewing-editor')
conflicts=('chewing-editor')
source=("git+https://github.com/chewing/chewing-editor.git")
sha256sums=('SKIP')


prepare() {
  cd "chewing-editor"

  mkdir -p "_build"
}

pkgver() {
  cd "chewing-editor"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "chewing-editor/_build"

  cmake -DCMAKE_INSTALL_PREFIX="/usr" DCMAKE_BUILD_TYPE=Release ../
  make
}

check() {
  cd "chewing-editor/_build"

  make test
}

package() {
  cd "chewing-editor/_build"

  make DESTDIR="$pkgdir" install
}
