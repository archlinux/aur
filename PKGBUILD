# Maintainer: Gabriel Fontes <eu@misterio.me>

pkgname=flavours
pkgdesc='A simple and easy cli to build and use base16 schemes'
pkgver=0.3.2
pkgrel=1
arch=('any')
url='https://github.com/Misterio77/flavours'
license=('MIT')
depends=('git')
makedepends=('rust')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/misterio77/flavours/archive/v${pkgver}.tar.gz")
sha256sums=('9503e2119bf356bda8b301b0eb2bd5391bab3422180e14cdbe7054e05f7505c5')

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
