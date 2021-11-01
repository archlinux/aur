# Maintainer: Gabriel Fontes <eu@misterio.me>

pkgname=flavours
pkgdesc='A simple and easy cli to build and use base16 schemes'
pkgver=0.5.2
pkgrel=1
arch=('any')
url='https://github.com/Misterio77/flavours'
license=('MIT')
depends=('git')
makedepends=('rust')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/misterio77/flavours/archive/v${pkgver}.tar.gz")
sha256sums=('6d4e956fa9785dcf51934eb1469c87168893178445ab185cdcd803a26cc3c2ce')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
	cargo run --release  -- --completions bash > bash
	cargo run --release  -- --completions fish > fish
	cargo run --release  -- --completions zsh > zsh
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "example.toml" "$pkgdir/etc/$pkgname.conf"
	#completions
	install -Dm644 "bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 "fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
	install -Dm644 "zsh"  "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
