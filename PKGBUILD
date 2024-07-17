# Maintainer: Yo'av Moshe <archlinux@yoavmoshe.com>
pkgname=wttrbar
pkgver=0.10.5
pkgrel=1
pkgdesc="Weather indicator for Waybar"
url="https://github.com/bjesus/wttrbar"
arch=("any")
license=("MIT")
options=(!lto)
makedepends=('rust')
source=("source-$pkgver.tar.gz::https://github.com/bjesus/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=("410b7cd13bc8a166032e7eac67f8b674fbba8ca45bd4027e5b7ef1d2f158052c15d5f3733ac962195a0b5c0005630d7f8811be8f4a6ee00a0f6fc0cea2442cf8")

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
