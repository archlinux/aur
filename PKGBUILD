# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=kopeninghours-git
_pkgname=kopeninghours
pkgver=24.01.75.r0.gc91bfae
pkgrel=1
pkgdesc="Library for parsing and evaluating OSM opening hours expressions."
arch=(x86_64)
url="https://invent.kde.org/libraries/kopeninghours"
license=(LGPL)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(qt6-declarative kholidays ki18n)
makedepends=(git extra-cmake-modules)
source=("git+https://invent.kde.org/libraries/kopeninghours.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DBUILD_TESTING='OFF' \
    -DBUILD_WITH_QT6='ON' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
