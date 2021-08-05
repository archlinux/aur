# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=glif
pkgname=mfek-$_pkgname
pkgver=1.0a
pkgrel=4
pkgdesc='A stand-alone glyph viewer and editor (from Modular Font Editor K)'
arch=(x86_64)
url="https://github.com/MFEK/$_pkgname"
license=(Apache)
depends=(gtk3
         libxcb)
makedepends=(cargo-nightly
             cmake
             python)
_archive="$_pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c2faa685f3642bfd0f3a93635d2afefe2429e8f76b798b84e0ba8e4ad7cb0a6b')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	export CARGO_TARAGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname"
	cargo test --frozen --all-features
}


package() {
	cd "$_archive"
	install -Dm0755 "target/release/MFEK$_pkgname" "$pkgdir/usr/bin/$pkgname"
}
