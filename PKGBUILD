# Maintainer: otreblan <otreblain@gmail.com>

pkgname=trantor
pkgver=1.5.14
pkgrel=1
pkgdesc='A non-blocking I/O tcp network lib based on c++14/17'
arch=('x86_64')
url="https://github.com/an-tao/trantor"
license=('BSD')
depends=('c-ares' 'openssl' 'gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('80775d65fd49dfb0eb85d70cd9c0f0cff38a7f46c90db918862c46e03ae63810')

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
