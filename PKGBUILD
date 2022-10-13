# Maintainer: Gabriel Fontes <eu@misterio.me>

pkgname=pmis
pkgdesc='Companion CLI tool for paste.misterio.me'
pkgver='1.4.0'
pkgrel=1
arch=('any')
url='https://paste.misterio.me'
license=('GPL3')
makedepends=('rust')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/misterio77/paste.misterio.me/archive/${pkgver}.tar.gz")
sha256sums=('c97cb859c15444c4f6e2141470a375f83c6f090ea32fe8d1ff6186198965ff71')

build() {
	cd "paste.misterio.me-$pkgver/cli"
	cargo build --release --locked
	cargo run --release  -- completions bash > bash
	cargo run --release  -- completions fish > fish
	cargo run --release  -- completions zsh > zsh
}

package() {
	cd "paste.misterio.me-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	#completions
	install -Dm644 "cli/bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 "cli/fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
	install -Dm644 "cli/zsh"  "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
