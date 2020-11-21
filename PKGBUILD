# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=kopeninghours-git
_pkgname=kopeninghours
pkgver=r82.a23fd0c
pkgrel=1
pkgdesc="Library for parsing and evaluating OSM opening hours expressions."
arch=(x86_64)
url="https://kontact.kde.org"
license=(LGPL)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(qt5-declarative kholidays)
makedepends=(git extra-cmake-modules)
source=("git+https://invent.kde.org/libraries/kopeninghours.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_pkgname \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
