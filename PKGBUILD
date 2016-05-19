# Maintainer: Jonathan Liu <net147@gmail.com>
_pkgname=qt5-datavis3d
pkgname=$_pkgname-git
pkgver=5.8.0.r1391.13a8c4e
pkgrel=1
pkgdesc="Provides multiple graph types to visualize data in 3D space both with C++ and Qt Quick 2"
arch=('i686' 'x86_64')
url="https://code.qt.io/cgit/qt/qtdatavis3d.git"
license=('GPL3')
depends=('qt5-declarative' 'qt5-multimedia')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://code.qt.io/qt/qtdatavis3d.git#branch=dev")
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
  sed -i '/^QMAKE_PRL_BUILD_DIR =/d' "$pkgdir/usr/lib"/*.prl
}

# vim:set ts=2 sw=2 et:
