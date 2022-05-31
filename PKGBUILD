pkgname=rocksdb-ldb
pkgver=7.2.2
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
sha256sums=('c4ea6bd2e3ffe3f0f8921c699234d59108c9122d61b0ba2aa78358642a7b614e')
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
