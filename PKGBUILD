# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=rocksdb
pkgver=3.11
pkgrel=1
pkgdesc='Embedded key-value store for fast storage'
arch=(i686 x86_64)
url='http://rocksdb.org'
license=(BSD)
depends=(gperftools zlib bzip2 lz4 snappy gcc-libs)
checkdepends=(python2)
source=(https://github.com/facebook/rocksdb/archive/rocksdb-$pkgver.zip)
sha256sums=('8214dde4a06b364e8aa081fb9e553aea302d554c79879fdf24be7c6844bcd675')

prepare() {
  cd rocksdb-rocksdb-$pkgver
  sed -e 's/\bpython\b/python2/' -i Makefile
}

build() {
  cd rocksdb-rocksdb-$pkgver
  make shared_lib
}

check() {
  cd rocksdb-rocksdb-$pkgver
# The are some tests are broken in 3.6.2 release
#  make check
}

package() {
  cd rocksdb-rocksdb-$pkgver
  install -d "$pkgdir"/usr/include
  cp -r include/rocksdb "$pkgdir"/usr/include
  install -m755 -D librocksdb.so "$pkgdir"/usr/lib/librocksdb.so
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
