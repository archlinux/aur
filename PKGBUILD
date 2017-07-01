# Maintainer: Tony <tony@criticalstack.com>

pkgname=rocksdb-static
pkgver=5.5.1
pkgrel=1
pkgdesc='Embedded key-value store for fast storage (static library)'
arch=(i686 x86_64)
url='http://rocksdb.org'
license=(BSD)
depends=(gperftools zlib bzip2 lz4 snappy gcc-libs)
checkdepends=(python2)
source=(https://github.com/facebook/rocksdb/archive/v$pkgver.zip)
sha256sums=('2f52fb05056999f565def3fb0b0e930e104f6ff30751388f29ee6a05a944647f')

prepare() {
  cd rocksdb-$pkgver
  sed -e 's/\bpython\b/python2/' -i Makefile
  if [ "$CARCH"  == "armv6h" ]; then
    sed -e 's/-momit-leaf-frame-pointer//' -i Makefile
  fi
}

build() {
  cd rocksdb-$pkgver
  make static_lib
}

package() {
  cd rocksdb-$pkgver
  install -m755 -D librocksdb.a "$pkgdir"/usr/lib/librocksdb.a
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
