# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="llm-cli"
pkgname="llm-cli"
pkgver=0.1.1
pkgrel=1
pkgdesc='A CLI for running inference on supported Large Language Models. Powered by th...'
url='https://crates.io/crates/llm-cli'
license=('Apache' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/llm-cli/0.1.1/download")
sha512sums=('dd013d9b8f27001ed695a203b6f647e140c46bf6b7228b0c1b3d9b83abdff3e2f0060263e9cdd0ded967f7f13bdf568e1d2f2415b08679302911a894757e6a45')

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
	install -Dm755 "target/release/llm" -t "$pkgdir/usr/bin"
}