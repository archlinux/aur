# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor : Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=kalker
pkgver=2.2.3
pkgrel=1
pkgdesc="A calculator program that supports user-defined variables, functions, derivation, and integration."
url="https://github.com/PaddiM8/kalker"
depends=('gcc-libs' 'mpfr' 'gmp' 'libmpc' 'glibc')
makedepends=('cargo')
arch=('i686' 'x86_64' 'aarch64')
license=('MIT')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/PaddiM8/$pkgname/archive/v$pkgver.tar.gz"
)

prepare() {
	cd "$pkgname-$pkgver" || exit
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver" || exit
	cargo build --release --features use-system-libs
}

package() {
	cd "$pkgname-$pkgver" || exit
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
b2sums=('809819116aa65cad991f3bb183a14d06ec7352989b20fed7a1273a5e601cf3a2841418515b775af02aa5e20306bd371326396efd9f8d5290466d36e95fdfcdf9')
