# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Matt Coffin <mcoffin13 at gmail.com>
pkgname=wl-clipboard-rs
pkgver=0.3.1
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
sha512sums=('c14bc58d8bc93cb3d452d9f37e662f2c3fbbaaf9f6ed2e489e704b312972e6262055eb53bfa7f94e238c43e2d59e6312630afa9171d7292ce498e2e9697d949c')

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
