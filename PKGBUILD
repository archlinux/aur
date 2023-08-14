# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=squiid
pkgver=1.0.0
pkgrel=2
pkgdesc="A modular calculator written in Rust. Intended to be the successor to ImaginaryInfinity Calculator."
arch=('any')
url="https://gitlab.com/ImaginaryInfinity/squiid-calculator/squiid"
license=('GPLv3')
makedepends=('cargo' 'cmake')
source=("https://gitlab.com/ImaginaryInfinity/squiid-calculator/squiid/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('bcc666a0687a4e7670d4ed67bc5070d2a1a14f6a5521f8362a2ec05d0e6038272fe64ead4bc2d29e84ded694befb2bed4e6739d14e718365b8fe96f1bd1cec2e')

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
	cargo test --frozen --all-features -p squiid -p squiid-engine -p squiid-parser
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
