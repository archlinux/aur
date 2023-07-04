# Maintainer: Rishabh Das <rdas@tutanota.com>
pkgname='uair'
pkgver=0.6.1
pkgrel=1
pkgdesc="An extensible pomodoro timer"
arch=('x86_64')
url="https://github.com/metent/uair"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/metent/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('c02e0a330b4f16c1811781a7b02455e8cb5f26d565d004332ef949931137a5b830ca8cdf544da27d5d309800620fa069f476637dd8a7bb4a958da0813aa71f4e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --locked --release

	scdoc < docs/uair.1.scd > docs/uair.1
	scdoc < docs/uairctl.1.scd > docs/uairctl.1
	scdoc < docs/uair.5.scd > docs/uair.5
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 target/release/uair "${pkgdir}/usr/bin/uair"
	install -Dm755 target/release/uairctl "${pkgdir}/usr/bin/uairctl"

	install -Dm644 docs/uair.1 "${pkgdir}/usr/share/man/man1/uair.1"
	install -Dm644 docs/uairctl.1 "${pkgdir}/usr/share/man/man1/uairctl.1"
	install -Dm644 docs/uair.5 "${pkgdir}/usr/share/man/man5/uair.5"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
