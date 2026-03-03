# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib
pkgver=0.36.0
pkgrel=1
pkgdesc='A C++ header-only HTTP/HTTPS server and client library'
arch=(any)
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
makedepends=('cmake>=3.14')
checkdepends=('gtest')
optdepends=('openssl>=3: HTTPS support' 'mbedtls: HTTPS support' 'wolfssl: HTTPS support' 'zlib: ZLIB compression support' 'brotli: Brotli compression support' 'zstd: Zstandard compression support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('e7d87596c919296ccb07f0b2b8efd286c8b872994d2a83c039db83c8a0620842cca0b31e54ff60e8d8c9b0c1c3c2d9b510ad7a58dd3553370aea01adebe0e211')
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
