# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="cargo-sort"
pkgname="$_crate"
pkgver=1.0.2
pkgrel=1
pkgdesc='Check if tables and items in a .toml file are lexically sorted'
license=('Apache' 'MIT')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$_crate"
depends=('gcc-libs')
makedepends=('cargo')
replaces=('cargo-sort-ck')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('d4a752db2c3765097db16f197afedb4f44a6aaed65248ca0128f714c6620b245722eca646b09265b8d8c5830480f6fccd682a812809aac4d52772b5fd5803bd5')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--locked \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/cargo-sort" -t "$pkgdir/usr/bin"
}
