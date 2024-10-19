# Maintainer: Luca Weiss <aur (at) lucaweiss (dot) eu>

pkgname=kpublictransport-git
_pkgname=kpublictransport
pkgver=24.01.90.r329.g55dbaaee
pkgrel=1
pkgdesc='Library to assist with accessing public transport timetables and other data'
arch=(x86_64)
url="https://invent.kde.org/libraries/kpublictransport"
license=(LGPL-2.0-or-later)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(gcc-libs
         glibc
         ki18n
         networkmanager-qt
         qt6-base
         qt6-declarative
         zlib)
makedepends=(git
             doxygen
             extra-cmake-modules
             protobuf
             qt6-tools)
optdepends=('kirigami: QML bindings')
source=("git+https://invent.kde.org/libraries/kpublictransport.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
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
