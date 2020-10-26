# Maintainer: Gabriel Fontes <eu@misterio.me>

pkgname=flavours
pkgdesc='A simple and easy cli to build and use base16 schemes'
pkgver=0.2.2
pkgrel=1
arch=('any')
url='https://github.com/Misterio77/flavours'
license=('MIT')
depends=('git')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/misterio77/flavours/archive/v${pkgver}.tar.gz")
sha256sums=('9df1a94a4262b03b43ec882c68b11dd6a710e0a33772936dc5e249a11f4c5bea')

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
	install -Dm644 "completions/bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 "completions/fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
	install -Dm644 "completions/zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
