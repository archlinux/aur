# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=chewing-editor-git
pkgver=0.1.1.r52.g806842c
pkgrel=1
pkgdesc="Cross platform chewing user phrase editor"
arch=('i686' 'x86_64')
url="https://chewing.im/"
license=('GPL-2.0-or-later')
depends=('glibc' 'hicolor-icon-theme' 'libchewing' 'qt5-base')
makedepends=('git' 'cmake' 'help2man' 'qt5-tools')
checkdepends=('valgrind')
provides=("chewing-editor=$pkgver")
conflicts=('chewing-editor')
source=("git+https://github.com/chewing/chewing-editor.git")
sha256sums=('SKIP')


pkgver() {
  cd "chewing-editor"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "chewing-editor"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    ./
  cmake --build "_build"
}

check() {
  cd "chewing-editor"

  #cmake --build "_build" --target test
}

package() {
  cd "chewing-editor"

  DESTDIR="$pkgdir" cmake --install "_build"
}
