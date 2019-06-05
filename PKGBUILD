# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Matt Coffin <mcoffin13 at gmail.com>
pkgname=wl-clipboard-rs
pkgver=0.3
pkgrel=2
epoch=
pkgdesc="A safe Rust reimplementation of the Wayland command-line copy/paste utilities"
arch=('x86_64')
url="https://github.com/YaLTeR/wl-clipboard-rs"
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=('wl-clipboard')
conflicts=('wl-clipboard')
source=("https://github.com/YaLTeR/wl-clipboard-rs/archive/v${pkgver}.tar.gz")
sha512sums=('e2e383df04618ca924b37cdaf11f0963f1f1519a871c1de89109f178751ce4fbcd0b42a34092b38ccdbe2b6ffe1560d7d75f8601bb132fe5d9007c8eb31bc536')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

check() {
	cd "$pkgname-$pkgver"
	cargo test
}

package() {
	if [ ! -d "$pkgdir/usr/bin" ]; then
		mkdir -p "$pkgdir/usr"
	fi
	cargo install --path "$pkgname-$pkgver" --root "$pkgdir/usr" --bins

	cd "$pkgname-$pkgver"

	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-APACHE LICENSE-MIT
}
