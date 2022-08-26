# Maintainer: Stefan Melmuk <stefan.melmuk@gmail.com>

pkgname=crowbook
pkgver=0.15.2e
pkgrel=3
pkgdesc="Converts books written in Markdown to HTML, LaTeX/PDF and EPUB"
arch=('x86_64')
url="https://github.com/lise-henry/crowbook"
license=('LGPL')
makedepends=('rust' 'cargo')
optdepends=('texlive-latexextra: create PDF')
source=("git+https://github.com/lise-henry/crowbook.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

check() {
	cd "$srcdir/$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target-test
	cargo test --release --frozen
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm0755 -t "${pkgdir}/usr/bin" target/release/${pkgname}
}
