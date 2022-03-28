# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="lottie2gif"
pkgname="$_crate"
pkgver=0.3.1
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
sha512sums=('90cb52ce3a4990f47531e9d76ad958d9baa67bc7b223beb332d15f78aba5ae7152f6264e52f8b026607e2e8aa12c1996d46f34a854301adb93fb24f4f1b3713c')

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
