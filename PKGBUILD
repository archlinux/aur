# Maintainer: Caleb Maclennan <caleb@aleque.com>

pkgname=scribl
pkgver=0.3.1
pkgrel=1
pkgdesc='make simple instructional videos'
arch=(x86_64)
url="https://github.com/jneem/$pkgname"
license=(Apache)
depends=(gst-plugins-base-libs
         gtk3)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e3fdd0dcc3f358528a7343babb23169718121e357a08ce16e079de08fea774e1')

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

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
