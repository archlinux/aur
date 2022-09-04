# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=tiledb
_pkgname=TileDB
pkgver=2.11.1
pkgrel=1
pkgdesc="The Universal Storage Engine"
arch=('x86_64')
url="https://tiledb.com/"
license=('MIT')
makedepends=('make')
depends=('gcc' 'cmake' 'lz4' 'bzip2' 'zstd' 'zlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TileDB-Inc/TileDB/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7e3e9fc86909544e27a292bbb82bcb5b6860e979392d49f6e5e924d98ff84c31')

build() {
  ls
  cd "$_pkgname-$pkgver"
  [ -e "build" ] || mkdir build && cd build
  ../bootstrap \
    --prefix=$pkgdir/usr/local \
    --enable-verbose \
    --enable-serialization \
    --enable-tools \
    --disable-werror
  make -j "$(nproc)"
}

package() {
  cd "$_pkgname-$pkgver"
  cd build
  make install-tiledb
  cd ..
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
