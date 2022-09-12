# Maintainer: Floréal TOUMIKIAN <floreal at nimukaito.net>
pkgname=redis-rejson
_pkgname=RedisJSON
pkgver=2.2.0
pkgrel=1
pkgdesc="Redis module that implements ECMA-404 The JSON Data Interchange Standard as a native data type."
arch=('x86_64')
url="https://github.com/RedisLabsModules/rejson"
license=('REDIS SOURCE AVAILABLE LICENSE AGREEMENT')
depends=('redis')
makedepends=("clang")
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('3446485c1ff3e60be2e17a98eb03525407df35739ec92814bca07ac97d92a2b053a69c27cec4d20968852ee9a2c8146fee0ad4a61e98a6b13a6fe80f28997d59')

prepare() {
	cd "$_pkgname-$pkgver"
}

build() {
	cd "$_pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$_pkgname-$pkgver"
	install -D target/release/deps/librejson.so $pkgdir/usr/lib/redis/rejson.so
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/rejson/LICENSE
}
