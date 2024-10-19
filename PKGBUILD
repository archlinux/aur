# Maintainer: Luca Weiss <aur (at) lucaweiss (dot) eu>

pkgname=kopeninghours-git
_pkgname=kopeninghours
pkgver=24.01.90.r36.gfc0ff95
pkgrel=1
pkgdesc='Library for parsing and evaluating OSM opening hours expressions'
arch=(x86_64)
url="https://invent.kde.org/libraries/kopeninghours"
license=(LGPL-2.0-or-later)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(gcc-libs
         glibc
         kholidays
         ki18n
         qt6-base)
makedepends=(git
             boost
             doxygen
             extra-cmake-modules
             python
             qt6-declarative
             qt6-doc
             qt6-tools)
optdepends=('boost-libs: Python bindings'
            'python: Python bindings'
            'qt6-declarative: QML bindings')
source=("git+https://invent.kde.org/libraries/kopeninghours.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_pkgname \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
