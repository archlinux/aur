# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="next-rust-release-date"
pkgname="$_crate"
pkgver=0.1.0
pkgrel=1
pkgdesc='When'"'"'s the next Rust release?'
license=('Apache' 'MIT')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$_crate"
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('ca65510cbcdd87e2531aeaed970c1ffeed3e898af0809397f0e41f67b94ae3d62a1874298e8d6439d9c9dfceab069ae30241705e5efe38920fa991c7042f2c68')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--locked \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/next-rust-release-date" -t "$pkgdir/usr/bin"
}
