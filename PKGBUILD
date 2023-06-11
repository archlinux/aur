# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sink
pkgver=0.9.0
pkgrel=3
pkgdesc='An offline-caching, synchronization and indexing system for PIM data'
arch=(x86_64)
url='https://community.kde.org/KDE_PIM'
license=(LGPL)
depends=(kcontacts kcalendarcore kasync kimap2 kdav2 lmdb xapian-core curl gpgme)
makedepends=(extra-cmake-modules flatbuffers)
#source=(https://download.kde.org/unstable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz)
source=(https://invent.kde.org/pim/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha256sums=('b16cf8f7a5f942bf02cdacb4942ef6cb959894ebc4d370ec21be26e948c67349')

prepare() {
  sed -e '/CMAKE_CXX_STANDARD/d' -i $pkgname-v$pkgver/CMakeLists.txt # Fix build
  find -name CMakeLists.txt | xargs sed -e '/add_subdirectory(tests)/d' -i  # Don't build tests 
}

build() {
  cmake -B build -S $pkgname-v$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
