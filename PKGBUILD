# Maintainer: Riccardo Berto <riccardobrt at gmail>
pkgname=redis-rejson
_pkgname=RedisJSON
pkgver=2.0.11
pkgrel=1
pkgdesc="Redis module that implements ECMA-404 The JSON Data Interchange Standard as a native data type."
arch=('x86_64')
url="https://github.com/RedisLabsModules/rejson"
license=('AGPL-3.0')
depends=('redis')
makedepends=("clang")
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('560839397f299f036ab6e2f747cc77e9b7889ead06a3d5c4d779fe48bd74919c5d0bf1b462f8e5cff43920ca1082e20305d28b0b7b3b1cf769e86f9ff981177e')

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
