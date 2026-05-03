# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib
pkgver=0.43.2
pkgrel=1
pkgdesc='A C++ header-only HTTP/HTTPS server and client library'
arch=(any)
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
makedepends=('cmake>=3.14')
checkdepends=('gtest')
optdepends=('openssl>=3: HTTPS support' 'mbedtls: HTTPS support' 'wolfssl: HTTPS support' 'zlib: ZLIB compression support' 'brotli: Brotli compression support' 'zstd: Zstandard compression support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('265355b86a798f628932b76402cba108f17402f573c79b00dbe54fa93e8b8ce4bb03adbc090b773c77fd175b6d108cd84481b10bb31f4fe60171d5d4bc3b74af')
build() {
	mkdir -p "$srcdir/$pkgname-$pkgver/build"
	cd "$srcdir/$pkgname-$pkgver/build"
	cmake -DCMAKE_BUILD_TYPE=Release \
		-DHTTPLIB_TEST=$CHECKFUNC \
		-DCMAKE_INSTALL_PREFIX=/usr ..
	cmake --build .
}
check() {
	cd "$srcdir/$pkgname-$pkgver/build"
	ctest
}
package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	DESTDIR="$pkgdir" cmake --build . --target install
}
