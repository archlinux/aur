# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname="wordle-finder"
pkgver=2.2.6
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
sha512sums=('0cad49b93e1ea95c13e0cbb4b08968cf47385c77b57dfe29e5ef9eee274e22adc5f0af9bd860eba1d8b85034a75fcad98dcdcbc72c393be4d29ffdeb3a2d416a')

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
