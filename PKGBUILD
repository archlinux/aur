# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="refinery_cli"
pkgname="$_crate"
pkgver=0.8.4
pkgrel=1
pkgdesc='Provides the CLI for the Refinery crate'
license=('MIT')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$_crate"
depends=('gcc-libs' 'openssl' 'sqlite')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('dbf7734e8cf449202d5bcb10f2764a5714b99f48b607a2272913ecf4cda544e42f1116e98697caa41afe0c02c5bb07ff5482096471f9debb0614cb07e53f61b7')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--locked \
		--no-default-features \
		--features 'postgresql,mysql,sqlite' \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/refinery" -t "$pkgdir/usr/bin"
}
