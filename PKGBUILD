# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib-compiled
_pkgname='cpp-httplib'
pkgver=0.15.2
pkgrel=1
pkgdesc='A C++ HTTP/HTTPS server and client library (compiled version)'
arch=('x86_64' 'i686')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
provides=("cpp-httplib=$pkgver" 'libhttplib.so')
conflicts=('cpp-httplib')
depends=('openssl>=3' 'zlib' 'brotli')
makedepends=('cmake>=3.14' 'python>=3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('8955a8c19e1dbcee792e0a2d8e87ec32248048f298e19d7d9adfcc4923f6dda73b0755fdfdcabbea0200934e9d0590de819474c50e4a4c1254724c399674ec68')
build() {
	mkdir -p "$srcdir/$_pkgname-$pkgver/build"
	cd "$srcdir/$_pkgname-$pkgver/build"
	cmake -DCMAKE_BUILD_TYPE=None \
		-DBUILD_SHARED_LIBS=ON \
		-DHTTPLIB_COMPILE=ON \
		-DHTTPLIB_REQUIRE_OPENSSL=ON \
		-DHTTPLIB_REQUIRE_ZLIB=ON \
		-DHTTPLIB_REQUIRE_BROTLI=ON \
		-DCMAKE_INSTALL_PREFIX=/usr ..
	cmake --build .
}
package() {
	cd "$srcdir/$_pkgname-$pkgver/build"
	DESTDIR="$pkgdir" cmake --build . --target install
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 '../README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
}
