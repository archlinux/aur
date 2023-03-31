# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=comrak
pkgver=0.18.0
pkgrel=1
pkgdesc='CommonMark + GFM compatible Markdown parser and renderer'
arch=(x86_64 i686)
url="https://github.com/kivikakk/$pkgname"
license=(BSD)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fce21e382e3c21064a364c6993ff6387fd481efd859c71c7e059cbfcdf14e832')

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
