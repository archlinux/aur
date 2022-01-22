# Maintainer: Gabriel Fontes <eu@misterio.me>

pkgname=pmis
pkgdesc='Companion CLI tool for paste.misterio.me'
pkgver='1.0.0'
pkgrel=1
arch=('any')
url='https://paste.misterio.me'
license=('GPL3')
makedepends=('rust')
source=("$pkgname-${pkgver}.tar.gz::https://git.sr.ht/~misterio/pmis/archive/${pkgver}.tar.gz")
sha256sums=('cebc2dcd635fbff5c02015b318165cdff78790131311f277369e87faf9c08037')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
	cargo run --release  -- completions bash > bash
	cargo run --release  -- completions fish > fish
	cargo run --release  -- completions zsh > zsh
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	#completions
	install -Dm644 "bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 "fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
	install -Dm644 "zsh"  "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
