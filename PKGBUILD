# Maintainer: Yo'av Moshe <archlinux@yoavmoshe.com>
pkgname=wttrbar
pkgver=0.8.0
pkgrel=1
pkgdesc="Weather indicator for Waybar"
url="https://github.com/bjesus/wttrbar"
arch=("any")
license=("MIT")
makedepends=('rust')
source=("source-$pkgver.tar.gz::https://github.com/bjesus/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=("896c279736189e589126092015a022ac1687b28b1298ee64b3d8c3976e5812b8f15d97264498ae28494bd3df03874b7cdd12791c6fc381269591e83fa5f153d2")

prepare() {
	mv $pkgname-$pkgver/* .
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
