# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="faketty"
pkgname="$_crate"
pkgver=1.0.5
pkgrel=1
pkgdesc='Wrapper to exec a command in a pty, even if redirecting the output'
license=('Apache' 'MIT')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$_crate"
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('f969f65cc2638b5fadde60b39bdd232beb59749da9e76b0c0186d7bc123d31efda64b5aab6d6de66f603d4386583456ad5aac9f0dfc630c3cd42b9e91d558f68')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--locked \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/faketty" -t "$pkgdir/usr/bin"
}
