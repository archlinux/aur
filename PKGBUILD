# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pgpkeydump
pkgver=0.2.3
pkgrel=1
pkgdesc="A tool for dumping PGP keys as JSON"
arch=('x86_64')
url=https://github.com/woodruffw/pgpkeydump
license=('Apache')
makedepends=(cargo)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('42b4e4dd009fad2d545f897965b160dc98b1841e2240652c67102f25a87d7be5')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
