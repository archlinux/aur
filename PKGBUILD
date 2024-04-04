# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor : Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=kalker
pkgver=2.2.0
pkgrel=1
pkgdesc="A calculator program that supports user-defined variables, functions, derivation, and integration."
url="https://github.com/PaddiM8/kalker"
depends=('gcc-libs' 'mpfr' 'gmp' 'libmpc' 'glibc')
makedepends=('cargo')
arch=('i686' 'x86_64' 'aarch64')
license=('MIT')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/PaddiM8/$pkgname/archive/v$pkgver.tar.gz"
	"build.patch"
)

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 <../build.patch
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
b2sums=('94b74a7f1a30c88aad1506a2885bbad3950b1397c9e4b7f03872d3ef6d0fdf425c15ba9012624893822589ff6aed006e535ddf1dc589bf5b5f85fdc491fee81c'
        '4d9f0e08c20fb074f68289397dff4a54add39ddc4cfa759a1f99709ffed416e3694d7285631130b30a4e66ac3dc916994c545fd384993ff433b429dd841634f9')
