# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=datavzrd
pkgver=2.23.1
pkgrel=1
pkgdesc="A tool to create visual HTML reports from collections of CSV/TSV tables"
arch=('x86_64')
url="https://github.com/datavzrd/datavzrd"
license=('MIT')
makedepends=(cargo)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4ddcc20ee9b1b6b071f8db39eb1c44d72d10a07f987a576cd435208e565a7e4a')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
