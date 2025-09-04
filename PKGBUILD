# Maintainer: Jan Ole Zabel <jan.zabel@posteo.de>
pkgname=minetest-worldmapper
pkgver=0.3.7
pkgrel=0
pkgdesc="Minetest world mapper"
arch=('x86_64')
url="https://github.com/UgnilJoZ/minetest-worldmapper"
license=('AGPL')
depends=('glibc')
makedepends=('cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
	minetest-worldmapper.6
	bash-completion.sh)
sha512sums=('1087bc3083debf458104abcd844b4f136f09e7def6adf58a642fb08470a3146f34abf5ae4aa0290a6d88cec790d04076f3335eabac7420a03e4ad379e93cd24a'
	'ece3fe00ce4b22e3630157fa2ec62b2ec1c7b6928d7af29e0340d67bb523d1f834c4bb25ac86d559cff6590effbbb1333da827f029728945f42066a083b6679f'
	'4c2a9cc21f74cf8251152ea03ee958f95fe9ac6b5ecba3c29d798d4d2156255ba4013dde8be132eb27eabd7478810e5c22c4d8ae7f00805221f7104581692b5a')
options=('!lto')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --offline
}

package() {
	mkdir -p "$pkgdir/usr/share/man/man6"
	install -Dm644 "minetest-worldmapper.6" "$pkgdir/usr/share/man/man6/"
	mkdir -p "$pkgdir/etc/bash_completion.d"
	install -Dm644 "bash-completion.sh" "$pkgdir/etc/bash_completion.d/minetest-worldmapper"
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

