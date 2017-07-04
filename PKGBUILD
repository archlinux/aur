# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sink
pkgver=0.3.0
pkgrel=1
pkgdesc="An offline-caching, synchronization and indexing system for PIM data"
arch=(i686 x86_64)
url="https://community.kde.org/KDE_PIM"
license=(LGPL)
depends=(curl kcontacts kasync kimap2 kdav2 lmdb)
makedepends=(extra-cmake-modules libgit2 flatbuffers)
source=("https://download.kde.org/unstable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz")
sha256sums=('b9f618316a60aae83174188aac63220cf77eb51f32238a55a998cb1db0f81534')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
