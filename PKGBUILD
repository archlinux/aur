# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib
pkgver=0.39.0
pkgrel=1
pkgdesc='A C++ header-only HTTP/HTTPS server and client library'
arch=(any)
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
makedepends=('cmake>=3.14')
checkdepends=('gtest')
optdepends=('openssl>=3: HTTPS support' 'mbedtls: HTTPS support' 'wolfssl: HTTPS support' 'zlib: ZLIB compression support' 'brotli: Brotli compression support' 'zstd: Zstandard compression support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('2970dd672a8ea49e558318d5224956c3f1d5b4c7e8b7345402f0705e22323e9b5b038eedcce996826e82b540d82b1836911a1b5d3ef99a9af1dbac2d5aa2f17e')
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
