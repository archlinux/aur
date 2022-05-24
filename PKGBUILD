# Maintainer: Caleb Maclennnan <caleb@alerque.com>

pkgname=bo
pkgver=0.4.0
pkgrel=1
pkgdesc='prose editor written in Rust with vim-like navigation'
arch=(x86_64)
url="https://github.com/brouberol/$pkgname"
license=(MIT)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('8b3300388ff7ebbf905c635b2c1f7985fc165c0de65cf19dee3d976d0781a059')

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
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
