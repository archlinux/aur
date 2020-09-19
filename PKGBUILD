# Maintainer: Gabriel Fontes <eu@misterio.me>

pkgname=flavours
pkgdesc='A simple and easy cli to build and use base16 schemes'
pkgver=0.1.3
pkgrel=2
arch=('any')
url='https://github.com/Misterio77/flavours'
license=('MIT')
depends=('git')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/misterio77/flavours/archive/v${pkgver}.tar.gz")
sha256sums=('436f3c40b9c61e779afa2bf9f3c7d6b0a7cd1a6b6dc486cd5ecae45537e867e3')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "example.toml" "$pkgdir/etc/$pkgname.conf"
	#completions
	install -Dm644 "completions/bash" "$pkgdir/usr/share/$pkgname"
	install -Dm644 "completions/fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
	install -Dm644 "completions/zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
