# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sink
pkgver=0.1.0
pkgrel=1
pkgdesc="An offline-caching, synchronization and indexing system for PIM data"
arch=(i686 x86_64)
url="https://community.kde.org/KDE_PIM"
license=(LGPL)
depends=(curl kcontacts kasync kimap2 lmdb)
makedepends=(extra-cmake-modules flatbuffers libgit2)
source=("https://download.kde.org/unstable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz")
sha256sums=('04aa9468c72a822fc050b89c13d78651a7a760afef44a3a27a872866842a4fb8')

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
