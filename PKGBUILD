# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=sssnake
pkgver=0.4.0
pkgrel=1
pkgdesc="Smart and sexy snake: the classic snake game for the terminal that can play itself and be used like a screensaver"
arch=('x86_64' 'aarch64')
url="https://github.com/AngelJumbo/sssnake"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ed2e4cd9d56b3d6a524f5e8467158c675fabd7e70916fc9d858b6bc4f64d9ae')

prepare() {
	cd "sssnake-$pkgver"
	rm -f sssnake
}

build() {
	cd "sssnake-$pkgver"
	make CC="gcc $CFLAGS $LDFLAGS -D_GNU_SOURCE"
}

package() {
	cd "sssnake-$pkgver"
	make install PREFIX=/usr DESTDIR="$pkgdir"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
