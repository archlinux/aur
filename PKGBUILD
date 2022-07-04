# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=comrak
pkgver=0.13.2
pkgrel=1
pkgdesc='CommonMark + GFM compatible Markdown parser and renderer'
arch=(x86_64 i686)
url="https://github.com/kivikakk/$pkgname"
license=(BSD)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d090f4c3f64d38358389fe4e90fb9c5bc9cbbcb3afe82e9bf05013349bdade69')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package () {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
