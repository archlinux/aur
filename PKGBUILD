# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: James Williams <jowilliams12000 at gmail dot com>
pkgname=wallust
pkgver=2.10.0
pkgrel=1
pkgdesc="generate colors from an image"
arch=('any')
url="https://codeberg.org/explosion-mental/wallust"
license=('custom:MIT')
makedepends=('cargo')
optdepends=('imagemagick')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('1575f74615eb36ed5bb9070be7d3ee6dc841f272abf8b19e65953833ca1eae55')

prepare() {
	cd "$pkgname"-"$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname"-"$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$pkgname"-"$pkgver"
	install -Dm755 target/release/wallust -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/wallust/LICENSE"
}
