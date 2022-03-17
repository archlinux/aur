# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="lottie2gif"
pkgname="$_crate"
pkgver=0.3.0
pkgrel=1
pkgdesc='Convert lottie files to GIF'
license=('MIT')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$_crate"
depends=('gcc-libs' 'rlottie')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('92b54d962c2c76a4170a08ac25136c05f140e91f999ba37f1a461cd038fac582ded103c3fe7b5f33d91415b569b65bbe657525356f82bc9f5b711cc96f7cfe1a')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--locked \
		--features 'clap' \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/lottie2gif" -t "$pkgdir/usr/bin"
}
