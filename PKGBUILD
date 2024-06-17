# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Lantald <lantald at Gmx dot com>
# Contributor: Danilo <aur at dbrgn dot ch>

pkgname=spatialindex
pkgver=1.9.3
pkgrel=2
pkgdesc='Extensible framework that supports robust spatial indexing methods and sophisticated spatial queries'
arch=(x86_64)
url="https://libspatialindex.github.io/"
license=(MIT)
depends=(gcc-libs)
makedepends=(git cmake)
_commit=1896a183afdff3f5845742ce3027553a88e13c3a  # tags/1.9.3
source=("git+https://github.com/libspatialindex/libspatialindex#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd libspatialindex
  git describe --tags | sed 's/-/+/g'
}

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
