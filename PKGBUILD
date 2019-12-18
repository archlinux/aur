# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Matt Coffin <mcoffin13 at gmail.com>
pkgname=wl-clipboard-rs
pkgver=0.4.0
pkgrel=1
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
sha512sums=('01aecc5dcb299b0211b9b4902c559a688a89ea6c79c915f3d0ba9e96337a9f2d1451f75f289c17e764a1234e8527d5e6bceccb5778579e96223afaef8b543d47')

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
