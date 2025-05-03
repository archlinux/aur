# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib
pkgver=0.20.1
pkgrel=1
pkgdesc='A C++ header-only HTTP/HTTPS server and client library'
arch=('any')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
makedepends=('cmake>=3.14')
optdepends=('openssl>=3: HTTPS support' 'zlib: ZLIB compression support' 'brotli: Brotli compression support' 'zstd: Zstandard compression support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('70a6d4572528272766b0d55b382bbe495107646e914193986ed7c336daae26f1c1bf6f63bbf96a278448c7c50982991a04ab7eb83e62f3b34bee560f0ef8172b')
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
