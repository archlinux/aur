# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib
pkgver=0.43.1
pkgrel=1
pkgdesc='A C++ header-only HTTP/HTTPS server and client library'
arch=(any)
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
makedepends=('cmake>=3.14')
checkdepends=('gtest')
optdepends=('openssl>=3: HTTPS support' 'mbedtls: HTTPS support' 'wolfssl: HTTPS support' 'zlib: ZLIB compression support' 'brotli: Brotli compression support' 'zstd: Zstandard compression support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('65b770da7dd22f672ddae849f42c9fdb545e000004f825c3776fe29512ca12a47f78c72f9934c4562f4168ce37081ec40f5fb25de797e7fb99e70cb5946e12d4')
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
