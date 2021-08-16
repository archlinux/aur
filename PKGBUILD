# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="cargo-diet"
pkgname="$_crate"
pkgver=1.2.1
pkgrel=1
pkgdesc='Make your crate lean by computing size-optimal include directives for Cargo manifests'
license=('MIT')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$_crate"
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('411231cbfd8a830d0998a4db8d42a43dc91cd20e0e22e604605bff6aaacd6e2a183198a34754ca7cd22d84340c824b9f7b274f585f24dadb75cbbc6538e91a7f')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--locked \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/cargo-diet" -t "$pkgdir/usr/bin"
}
