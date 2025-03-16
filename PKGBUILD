# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor : Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=kalker
pkgver=2.2.1
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
	cd "$pkgname-$pkgver" || exit
	patch -p1 <../build.patch
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver" || exit
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver" || exit
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
b2sums=('bc6001cc1a1be753b69c8049f068bae890c7793f8eefe80fa7077b6df1de38953f218608ef02e1aa97ca33435f40e56d50dd387f2cd67d346b77dbd78cd80b7d'
        '4d9f0e08c20fb074f68289397dff4a54add39ddc4cfa759a1f99709ffed416e3694d7285631130b30a4e66ac3dc916994c545fd384993ff433b429dd841634f9')
