# Maintainer: otreblan <otreblain@gmail.com>

pkgname=trantor
pkgver=1.5.28
pkgrel=1
pkgdesc='A non-blocking I/O tcp network lib based on c++14/17'
arch=('x86_64')
url="https://github.com/an-tao/trantor"
license=('BSD')
depends=('c-ares' 'openssl' 'gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8e3e493427a1704ee0d8cacb65e61b544d4b3a7159f5a4e55517272e1fb25c8f')

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
