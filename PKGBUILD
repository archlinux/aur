# Maintainer: tank142
pkgname=wine-gui-git
pkgver=0.14alpha.3.g82ee4c7
pkgrel=1
pkgdesc="GUI for managing Windows programs under linux"
arch=('x86_64')
url="https://github.com/tank142/wine-gui"
license=('GPL3')
depends=('qt6-base' 'xdg-utils' 'winetricks' 'icoutils' 'imagemagick')
makedepends=('git')
source=('wine-gui::git+https://github.com/tank142/wine-gui.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/wine-gui"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  rm -rf "$srcdir/wine-gui/src/build"
  mkdir "$srcdir/wine-gui/src/build"
  cd "$srcdir/wine-gui/src/build"
  qmake6 ..
  make
}

package() {
  cd "$srcdir/wine-gui/src/build"
  make -C ./ INSTALL_ROOT="$pkgdir/" install
}
