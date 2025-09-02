# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Lantald <lantald at Gmx dot com>
# Contributor: Danilo <aur at dbrgn dot ch>

pkgname=spatialindex
pkgver=2.0.0
pkgrel=1
pkgdesc='Extensible framework that supports robust spatial indexing methods and sophisticated spatial queries'
arch=(x86_64)
url="https://libspatialindex.github.io/"
license=(MIT)
depends=(gcc-libs)
makedepends=(git cmake)
source=("git+https://github.com/libspatialindex/libspatialindex#tag=$pkgver")
sha256sums=('a0442c281e57e60ce3b91c6a449da835c764c18aa6d6ed59be0b1e38223ad6b7')

build() {
  mkdir build && cd build
  cmake ../libspatialindex \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check() {
  cd build
  make -k test
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir"/libspatialindex/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
