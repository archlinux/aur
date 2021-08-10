# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=xi-core
_pkgname=xi-editor
pkgver=0.3.0
pkgrel=3
pkgdesc='A modern editor with a backend written in Rust'
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/$_pkgname/$_pkgname"
license=(Apache)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e42998ad9b6d6df0f797afd005f9c1286aad24c30a77d0dd380730c248274b8d')

_dir="$_pkgname-$pkgver/rust"

prepare() {
	cd "$_dir"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_dir"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_dir"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$_dir"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
