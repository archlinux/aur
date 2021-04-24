# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="cargo-sort-ck"
pkgname="$_crate"
pkgver=2.1.1
pkgrel=2
pkgdesc='Check if tables and items in a .toml file are lexically sorted'
license=('Apache' 'MIT')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$_crate"
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('90d2c18ffb944960eb2f4b5e264c9b9b5537942afc8cf26581a72390776bd9f1caf355943b9d1eb245cde4302fa4d0e1e3df44474ce72be95b569529c946703c')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--locked \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/cargo-sort-ck" -t "$pkgdir/usr/bin"
}
