# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname="wordle-finder"
pkgver=2.3.1
pkgrel=1
pkgdesc="A cross-platform CLI/GUI utility to assist in finding the word for the game "Wordle" and other
similar knock-offs"
arch=('any')
url="https://github.com/TabulateJarl8/wordle-finder/"
license=('GPL3')
makedepends=('cargo')
optdepends=('webkit2gtk: GUI Frontend')
options=('strip')

source=("https://github.com/TabulateJarl8/wordle-finder/archive/v$pkgver.tar.gz")
sha512sums=('b6cd5cc0f95960f86311898983ac7968c24a2f7c22b7e20e9f7ca2b91812276710e3d3928a697cb837a33d856692507ab345004a78339f8f8e5e236d0618a17c')

_dir="${pkgname}-${pkgver}"

prepare() {
	cd "${_dir}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${_dir}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "${_dir}/target/release/$pkgname"
}
