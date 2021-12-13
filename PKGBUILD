# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=glif
pkgname=mfek-$_pkgname
pkgver=1.0.1a
pkgrel=2
pkgdesc='A stand-alone glyph viewer and editor (from Modular Font Editor K)'
arch=(x86_64)
url="https://github.com/MFEK/$_pkgname"
license=(Apache)
depends=(gtk3
         libxcb
         sdl2)
makedepends=(cargo-nightly
             cmake
             python)
_archive="$_pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8903d229153e70a4c43018c219b7c498135811f4850c1d8067b2bf4e175652c0')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --no-default-features
}

check() {
	cd "$_archive"
	cargo test --frozen --no-default-features
}


package() {
	cd "$_archive"
	install -Dm0755 "target/release/MFEK$_pkgname" "$pkgdir/usr/bin/$pkgname"
}
