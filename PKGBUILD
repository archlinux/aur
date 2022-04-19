# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname="wordle-finder"
pkgver=2.3.0
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
sha512sums=('606fc3689b535e81d4cfb98c2b932f419bc38b17ca625917c50e48b180baa1fb7ff7ba617556d5ce7d0851305fa628fe0401e46db45541be42b0ad49fa8fdd25')

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
