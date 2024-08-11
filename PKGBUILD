# Maintainer: Konrad Beckmann <konrad.beckmann@gmail.com>

_pkgname=AppCSXCAD
pkgname=appcsxcad-git
pkgver=20200104
pkgrel=1
pkgdesc="Minimal GUI Application using the QCSXCAD library. Built from git."
arch=('x86_64')
url="https://github.com/thliebig/$_pkgname"
license=('GPL-3.0-or-later')
depends=('csxcad-git' 'openems-git' 'qcsxcad' 'vtk' 'qt5-base' 'qt5-x11extras' 'libxcursor' 'glew' 'hdf5-openmpi')
provides=('appcsxcad')
conflicts=('appcsxcad')
makedepends=('git' 'cmake' 'nlohmann-json')
source=("git+https://github.com/thliebig/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$srcdir/$_pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="$pkgdir" install
}
