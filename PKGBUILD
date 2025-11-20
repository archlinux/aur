# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor : Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=kalker
pkgver=2.2.2
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
b2sums=('dec72276ec4393ff310277c5589614558204a31a916df20048af05cfa48e891184f57c2348b6e2b069622946c9d9ac4fe1920a08de8476ea4eafef5e0740bce4'
        '4d9f0e08c20fb074f68289397dff4a54add39ddc4cfa759a1f99709ffed416e3694d7285631130b30a4e66ac3dc916994c545fd384993ff433b429dd841634f9')
