# Maintainer: Mark <no@email.com>
pkgname=daisy
_cargoname=daisycalc
pkgver=0.2.14
pkgrel=6
pkgdesc="TUI scientific calculator with support for units."
url="https://git.betalupi.com/Mark/daisy"
license=('GPL')
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$_cargoname/$_cargoname-$pkgver.crate")
sha1sums=('0c7159706e52b3e4eb6e4845625bc0b338e4912e')


prepare() {
	cd "$_cargoname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_cargoname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_cargoname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$_cargoname-$pkgver"
	mv "target/release/$_cargoname" "target/release/$pkgname"

	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}