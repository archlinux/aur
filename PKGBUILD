# Maintainer: Riccardo Berto <riccardobrt at gmail>
pkgname=redis-rejson
_pkgname=RedisJSON
pkgver=2.0.5
pkgrel=1
pkgdesc="Redis module that implements ECMA-404 The JSON Data Interchange Standard as a native data type."
arch=('x86_64')
url="https://github.com/RedisLabsModules/rejson"
license=('AGPL-3.0')
depends=('redis')
makedepends=("clang")
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('1aed71cd5f1d563b0d2607f9bcb44a81e35db64b9d249c710520737a924011ef2b04faeb79cdb39f57c35e23550cc2302109183d94c9b26f88c1e3aa743b5f4d')

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
