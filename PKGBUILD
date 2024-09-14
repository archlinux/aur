# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib
pkgver=0.18.0
pkgrel=1
pkgdesc='A C++ header-only HTTP/HTTPS server and client library'
arch=('any')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
makedepends=('cmake>=3.14')
optdepends=('openssl>=3: HTTPS support' 'zlib: compression support' 'brotli: Brotli decompression support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('35ff903d51fee5428d7a95a0406460f8a18d1b5653f6ec8f353d7a2f1084598e599b24d0401f7214d5ee8d9764c74a4e617fff55acd4e6733ab1b9f2d7d4403c')
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
