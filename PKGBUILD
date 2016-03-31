# Maintainer: Jonathan Liu <net147@gmail.com>
_pkgname=qt5-declarative-render2d
pkgname=$_pkgname-git
pkgver=5.7.0.r99.d26f29a
pkgrel=1
pkgdesc="Raster backend for QtQuick scene graph"
arch=('i686' 'x86_64')
url="https://code.qt.io/cgit/qt/qtdeclarative-render2d.git"
license=('GPL3')
depends=('qt5-declarative')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://code.qt.io/qt/qtdeclarative-render2d.git#branch=dev")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  module_version="$(sed -n 's/^MODULE_VERSION\s*=\s*\(.*\)/\1/p' .qmake.conf)"
  printf "$module_version.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  qmake "../$_pkgname"
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
