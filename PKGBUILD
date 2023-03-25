# Maintainer: otreblan <otreblain@gmail.com>

pkgname=trantor
pkgver=1.5.11
pkgrel=1
pkgdesc='A non-blocking I/O tcp network lib based on c++14/17'
arch=('x86_64')
url="https://github.com/an-tao/trantor"
license=('BSD')
depends=('c-ares' 'openssl' 'gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3cff9653380f65acaa6ffa191620a2783e866a4552c3408a6919759ce4cfc1dc')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON

	cmake --build build
}

package() {
	install -Dm644 "$pkgname-$pkgver/License" "$pkgdir/usr/share/licenses/$pkgname/License"

	DESTDIR="$pkgdir" cmake --install build
}
