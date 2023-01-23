# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=datavzrd
pkgver=2.14.1
pkgrel=1
pkgdesc="A tool to create visual HTML reports from collections of CSV/TSV tables"
arch=('x86_64')
url="https://github.com/datavzrd/datavzrd"
license=('MIT')
makedepends=(cargo)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a1c131bccf9c71bab9c1ef88f5a697923835c2afa037cfea39cb04f73183e1d2')

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
