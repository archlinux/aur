# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="faketty"
pkgname="faketty"
pkgver=1.0.10
pkgrel=1
pkgdesc='Wrapper to exec a command in a pty, even if redirecting the output'
url='https://crates.io/crates/faketty'
license=('Apache' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/faketty/1.0.10/download")
sha512sums=('45e7f5656dce08eb18cf194f825016af0dd123d1d4ded4347e8837e587101e4b4bd6b5f5bfd3e9e35cb0d2909071d93bb5d37b7bba4535715ace519daeea8da6')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$pkgver"

	cargo fetch --locked
}

build() {
	cd "$srcdir/$_crate-$pkgver"
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/faketty" -t "$pkgdir/usr/bin"
}