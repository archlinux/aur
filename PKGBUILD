# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pgpkeydump
pkgver=0.1.4
pkgrel=1
pkgdesc="A tool for dumping PGP keys as JSON"
arch=('x86_64')
url=https://github.com/woodruffw/pgpkeydump
license=('Apache')
makedepends=(cargo)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('7dc9b54d3d66309a18fd80a116cd673cfae2223011ee0bcc0cb97b28a94a65f9')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
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
