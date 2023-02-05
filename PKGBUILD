# Maintainer: Jan Ole Zabel <jan.zabel@posteo.de>
pkgname=minetest-worldmapper
pkgver=0.3.2
pkgrel=2
pkgdesc="Minetest world mapper"
arch=('x86_64')
url="https://github.com/UgnilJoZ/minetest-worldmapper"
license=('AGPL')
depends=('glibc')
makedepends=('cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ff2b662f5a171e0b38ca10cd762548eacc20607b1e1ae07650903b69a3af2bc745aec83bb6433c942c532c5428cefc8c2fa88349bbd4985c610b51f1d1a569bc')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --offline
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

