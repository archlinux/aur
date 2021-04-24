# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="cargo-readme"
pkgname="$_crate"
pkgver=3.2.0
pkgrel=4
pkgdesc='A cargo subcommand to generate README.md content from doc comments'
license=('Apache' 'MIT')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$_crate"
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('49fdfcde0913e330e4f79e56d41ff675e2a1b0d0e11b09d8b3db348e11fabe9024ec71eeef72465113e92aa49324b6d5ab5e7607e196d35730d4fe059feeb5e9')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--locked \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/cargo-readme" -t "$pkgdir/usr/bin"
}
