pkgname=rocksdb-ldb
pkgver=7.6.0
pkgrel=1
pkgdesc='The 'ldb' from the RocksDB storage'
arch=(i686 x86_64)
url='http://rocksdb.org'
license=(Apache leveldb)
depends=(
    'bzip2'
    'gcc-libs'
    'lz4'
    'snappy'
    'zlib'
    'gflags'
)
makedepends=('gcc' 'make')
source=(https://github.com/facebook/rocksdb/archive/v${pkgver}.tar.gz)
sha256sums=('ee91f5043dc7d28b092a09800a12c011b099a5515ffb3939841b6fb0327d6eae')
provides=(rocksdb-ldb)

build() {
  cd "rocksdb-$pkgver"
  make clean
  DISABLE_WARNING_AS_ERROR=1 DEBUG_LEVEL=0 make ldb -j2
}

package() {
  cd "rocksdb-$pkgver"
  install -m755 -D ldb "$pkgdir"/usr/bin/rocksdb-ldb
}
