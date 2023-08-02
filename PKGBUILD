# Maintainer: Floréal TOUMIKIAN <floreal at nimukaito.net>
pkgname=redis-rejson
_pkgname=RedisJSON
pkgver=2.6.4
pkgrel=1
pkgdesc="Redis module that implements ECMA-404 The JSON Data Interchange Standard as a native data type."
arch=('x86_64')
url="https://github.com/RedisLabsModules/rejson"
license=('custom:REDIS SOURCE AVAILABLE LICENSE AGREEMENT')
depends=('redis')
makedepends=("clang")
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('bf88b8fd1e23b2e1e233fc2e7cd200e07066d1da370826e9a35d17e45e88e79b37783c4a21c0df7a2cee99403833c19475869320ffc87cfe6f70786609aed65e')

prepare() {
	cd "$_pkgname-$pkgver"
        mv LICENSE.txt LICENSE
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
