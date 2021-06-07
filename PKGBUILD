# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="cargo-sort"
pkgname="$_crate"
pkgver=1.0.4
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
sha512sums=('e62df34c569e7b6620400cf0a1da9d4a0c463875197dd3bbaf42dfff3462f3581ab137195d0951b9d1c8ffd055d0d0d8a6f1709f3169cfdaee408656625b9132')

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
