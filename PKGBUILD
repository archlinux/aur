# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="faketty"
pkgname="faketty"
pkgver=1.0.12
pkgrel=1
pkgdesc='Wrapper to exec a command in a pty, even if redirecting the output'
url='https://crates.io/crates/faketty'
license=('Apache' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/faketty/1.0.12/download")
sha512sums=('81178bb49341695df33d30e53eb1c024e05257ff9beedceea419446207d58a394f40a7df4a4fd8fb48914abef9ca04fdc279fc070636ae5a46dbd3b721b63293')

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
	install -Dm644 "LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname/"
}