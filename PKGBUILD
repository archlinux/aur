# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Lantald <lantald at Gmx dot com>
# Contributor: Danilo <aur at dbrgn dot ch>

pkgname=spatialindex
pkgver=1.9.0
pkgrel=1
pkgdesc='Extensible framework that supports robust spatial indexing methods and sophisticated spatial queries'
arch=(x86_64)
url="https://libspatialindex.github.io/"
license=(MIT)
depends=(gcc-libs)
makedepends=(git)
_commit=9ce9e86c27b89f17e8b10e1651edbcfc46d1d34d  # tags/1.9.0
source=("git+https://github.com/libspatialindex/libspatialindex#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd libspatialindex
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libspatialindex
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd libspatialindex
  ./configure --prefix=/usr
  make
}

check() {
  cd libspatialindex
  make -k check
}

package() {
  cd libspatialindex
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
