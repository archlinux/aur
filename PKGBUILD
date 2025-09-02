# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib
pkgver=0.26.0
pkgrel=1
pkgdesc='A C++ header-only HTTP/HTTPS server and client library'
arch=(any)
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
makedepends=('cmake>=3.14')
optdepends=('openssl>=3: HTTPS support' 'zlib: ZLIB compression support' 'brotli: Brotli compression support' 'zstd: Zstandard compression support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('b364500f76e2ecb0fe21b032d831272e3f1dfeea71af74e325f8fc4ce9dcdb3c941b97a5b422bdeafb9facd058597b90f8bfc284fb9afe3c33fefa15dd5a010b')
build() {
	mkdir -p "$srcdir/$pkgname-$pkgver/build"
	cd "$srcdir/$pkgname-$pkgver/build"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
	cmake --build .
}
package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	DESTDIR="$pkgdir" cmake --build . --target install
}
