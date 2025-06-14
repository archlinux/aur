#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=rocksdb-tools
pkgver=10.2.1
pkgrel=1
pkgdesc='Core tools from the RocksDB storage'
arch=(i686 x86_64)
url='http://rocksdb.org'
license=(Apache-2.0)
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
sha256sums=('d1ddfd3551e649f7e2d180d5a6a006d90cfde56dcfe1e548c58d95b7f1c87049')
provides=(rocksdb-tools)

build() {
  cd "rocksdb-$pkgver"

  export CXXFLAGS="$CXXFLAGS -include cstdint"

  make clean
  DISABLE_WARNING_AS_ERROR=1 DEBUG_LEVEL=0 make ldb sst_dump -j $(nproc)
}

package() {
  cd "rocksdb-$pkgver"

  install -m755 -D ldb "$pkgdir"/usr/bin/rocksdb-ldb
  install -m755 -D sst_dump "$pkgdir"/usr/bin/rocksdb-sst_dump
}
