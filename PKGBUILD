# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="refinery_cli"
pkgname="$_crate"
pkgver=0.7.0
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
sha512sums=('cb377e8a7aee097036380a519387cd0f43ffa6c4945e479360a7a10572993a17f83e2ef595369c74ef339e19a936a93c70c83265072cb4ba8a810cafa0aacb78')

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
