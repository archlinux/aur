# Maintainer: Caleb Maclennnan <caleb@alerque.com>

pkgname=bo
pkgver=0.3.2
pkgrel=1
pkgdesc='prose editor written in Rust with vim-like navigation'
arch=(x86_64)
url="https://github.com/brouberol/$pkgname"
license=(MIT)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('39394d8453a579e0d38f3a69cc15f8e380ba76336aeeaf86209e1f4bcf7054f7')

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
