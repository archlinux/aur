#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=rocksdb-tools
pkgver=10.7.5
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
sha256sums=('a9948bf5f00dd1e656fc40c4b0bf39001c3773ad22c56959bdb1c940d10e3d8d')
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
