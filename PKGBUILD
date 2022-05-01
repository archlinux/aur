# Maintainer: Caleb Maclennnan <caleb@alerque.com>

pkgname=bo
pkgver=0.3.3
pkgrel=1
pkgdesc='prose editor written in Rust with vim-like navigation'
arch=(x86_64)
url="https://github.com/brouberol/$pkgname"
license=(MIT)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('9190abcb138bc1cd5398416b035a9644159c3e26ee4a5777818670c737c295a8')

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
