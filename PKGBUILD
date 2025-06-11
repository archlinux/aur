# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib
pkgver=0.21.0
pkgrel=1
pkgdesc='A C++ header-only HTTP/HTTPS server and client library'
arch=('any')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
makedepends=('cmake>=3.14')
optdepends=('openssl>=3: HTTPS support' 'zlib: ZLIB compression support' 'brotli: Brotli compression support' 'zstd: Zstandard compression support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('f0bcabab898afb4b1c8a272619c3435686551bd755613369771a31d39b9a73213dab2f5d97b7b1e726863cc4653debcd0930099ac212ac23eed453962f1fa223')
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
