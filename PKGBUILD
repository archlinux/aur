# Maintainer: Dominic Meiser [git at msrd0 dot de]

pkgname=cargo-diet
pkgver=1.2.0
pkgrel=1
pkgdesc='Make your crate lean by computing size-optimal include directives for Cargo manifests'
arch=('x86_64')
url='https://github.com/the-lean-crate/cargo-diet/blob/master/README.md'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=(
	"cargo-diet.tar.gz::https://crates.io/api/v1/crates/cargo-diet/$pkgver/download"
	"https://github.com/the-lean-crate/cargo-diet/raw/18eae12662ff6fdf02e09e388147e7764843cb2d/LICENSE.md"
)
sha512sums=('b2205482834bfafcdf3d76138fba84498fe083a81be0408d30a05b178aaad2771b2060ccc85fde75c20e87473d2473d78dae49f39e4cb9029f904a7eb69c8d6f'
            '2b83f6205711f7b5b1d3e3ba142cafd8c3ce50dfebadfa0f428d66ec8e25c115a7db1abbab7a0d4449d97c54e1b4363e938f4854dda9a11ce219adc011bb8993')

build() {
	cd "$srcdir/cargo-diet-$pkgver"
	cargo build --release
}

package() {
	cd "$srcdir/cargo-diet-$pkgver"
	install -Dm755 "target/release/cargo-diet" -t "$pkgdir/usr/bin"
	install -Dm644 "$srcdir/LICENSE.md" -t "$pkgdir/usr/share/licenses/$pkgname"
}
