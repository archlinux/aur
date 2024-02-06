# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib
pkgver=0.15.3
pkgrel=1
pkgdesc='A C++ header-only HTTP/HTTPS server and client library'
arch=('any')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
makedepends=('cmake>=3.14')
optdepends=('openssl>=3: HTTPS support' 'zlib: compression support' 'brotli: Brotli decompression support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('f7fc9c9eb71f091b82958e023a7b417b30d2590fd5d1a920d1c98361f34bcaca796dbeda7f9fdb8b2c722a8968977b77463c6cbb252cba9823a79c22471fa439')
build() {
	mkdir -p "$srcdir/$pkgname-$pkgver/build"
	cd "$srcdir/$pkgname-$pkgver/build"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
	cmake --build .
}
package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	DESTDIR="$pkgdir" cmake --build . --target install
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 '../README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
}
