# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="clickhouse-cpp"
pkgver=2.6.2
pkgrel=1
pkgdesc="C++ client library for ClickHouse"
arch=("x86_64" "aarch64")
url="https://github.com/ClickHouse/clickhouse-cpp"
license=("Apache-2.0")
depends=("abseil-cpp" "gcc-libs" "glibc" "lz4" "openssl" "zstd")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bac497857759e991fa4e1638bccf936cb36d10ad79273695a570272cc4891428')

build(){
 # cityhash is not packaged for Arch, so the bundled copy is used
 cmake -B build -S "$pkgname-$pkgver" \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DBUILD_SHARED_LIBS=ON \
  -DWITH_OPENSSL=ON \
  -DWITH_SYSTEM_ABSEIL=ON \
  -DWITH_SYSTEM_LZ4=ON \
  -DWITH_SYSTEM_ZSTD=ON
 cmake --build build
}

package(){
 DESTDIR="$pkgdir" cmake --install build
 install -D -m 644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
