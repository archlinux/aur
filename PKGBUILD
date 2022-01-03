# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="refinery_cli"
pkgname="$_crate"
pkgver=0.8.1
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
sha512sums=('6278fca7e1a4d8b32187d9712a960ba718e52f4c55b5632b4688a5240c460555a47877b7b290bd85719caa78cd18531bb9c290df0b59ae2bcf4ca9eef47e6379')

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
