# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Scott Little swlittle7 [at] gmail [dot] com

pkgname=nat
_pkgname=natls
pkgver=2.1.14
pkgrel=1
pkgdesc="The Better ls"
arch=(x86_64)
url="https://github.com/willdoescode/nat"
license=('MIT')
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('bcce7eebf7f9396f76556b067df1223c54119a82140df7d109e1d3073899c85c')


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

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
