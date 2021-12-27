# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="cargo-doc2readme"
pkgname="$_crate"
pkgver=0.0.8
pkgrel=1
pkgdesc='cargo subcommand to create a readme file containing the rustdoc comments from your code'
license=('Apache')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$_crate"
depends=('gcc-libs' 'curl' 'libgit2>=1:1.3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('b88ea2ba316da718984cb32f7637b4690da1c6c36849572884fb487afadd73e326acea346b3d7f746ea42cd46f786cdd5290ee26ed56fea94654e540cac5eae9')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	LIBSSH2_SYS_USE_PKG_CONFIG='1' \
	cargo build \
		--locked \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/cargo-doc2readme" -t "$pkgdir/usr/bin"
}
