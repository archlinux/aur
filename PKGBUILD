# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor : Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=kalker
pkgver=2.1.0
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
b2sums=('5d21c6281121193e027e64ba18c6496fe7dd2aa4d5a28ff592eba81dd8f5c3a3611cba57ec18ab8c527227382396278e34461ae0157a3a62aac9054a7f72ac1b'
	'3837356a5404453253956a6be7e7d7513b3d263e18a111b4b80817fddb15e099b52c37c1d2e247ac346716d0e8d47d971c3467f483c67db5d4396154ddf155bf')
