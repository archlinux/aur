# Maintainer: Nogweii <packages@nogweii.net>
_libname=json5format
pkgname=formatjson5
pkgver=0.2.6
pkgrel=1
pkgdesc="Format a JSON5 document with comments"
arch=(x86_64 arm64)
url="https://github.com/google/json5format"
license=('BSD')
makedepends=(cargo)
source=("$_libname-$pkgver.tar.gz::https://static.crates.io/crates/$_libname/$_libname-$pkgver.crate")
sha256sums=('b2894a72f82fa9f20e628bf4329cd0fb8e9fd5e87cc35944665a42b25bae9902')

prepare() {
	cd "$_libname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_libname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features --example $pkgname
}

check() {
	cd "$_libname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$_libname-$pkgver"

	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/examples/$pkgname"
}
