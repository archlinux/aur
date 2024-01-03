# Maintainer: Jan Ole Zabel <jan.zabel@posteo.de>
pkgname=minetest-worldmapper
pkgver=0.3.4
pkgrel=0
pkgdesc="Minetest world mapper"
arch=('x86_64')
url="https://github.com/UgnilJoZ/minetest-worldmapper"
license=('AGPL')
depends=('glibc')
makedepends=('cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('10d01194cf5a1314b3c468230eba7bfe101d48e633899b8cd771f523b3d158ba03245de12c626596d4a7b673dcd6a7d06483748a2ea31fab2786050a7e3556db')

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

