# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=glif
pkgname=mfek-$_pkgname
pkgver=1.1.0b2
pkgrel=1
pkgdesc='A stand-alone glyph viewer and editor (from Modular Font Editor K)'
arch=(x86_64)
url="https://github.com/MFEK/$_pkgname"
license=(Apache)
depends=(gtk3
         libxcb
         sdl2)
makedepends=(cargo
             cmake
             python)
optdepends=('mfek-metadata: read and write font metadata')
_archive="$_pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dacc23c9355bad3937fca0de265bc813d851c83875e331a7788f92183a37ebd5')

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
