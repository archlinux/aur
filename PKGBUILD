# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=scribl
pkgver=0.3.3
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
sha256sums=('c70bfb7fa03d1d134df3319c75edc56082c0983369728e3c4469feb31cfc4fe8')

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
