# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=tiledb
_pkgname=TileDB
pkgver=2.8.2
pkgrel=2
pkgdesc="The Universal Storage Engine"
arch=('x86_64')
url="https://tiledb.com/"
license=('MIT')
makedepends=('make')
depends=('gcc' 'cmake' 'lz4' 'bzip2' 'zstd' 'zlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TileDB-Inc/TileDB/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9c258258b3fe0b6d0d35c234d4422e7de6cb43f6ce767134f7d7aefbcda15b81')

build() {
  ls
  cd "$_pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/local" \
  cmake .
  make -j "$(nproc)"
}

package() {
  cd "$_pkgname-$pkgver"
  make install
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
