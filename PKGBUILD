# Maintainer: Rishabh Das <rdas@tutanota.com>
pkgname='uair'
pkgver=0.4.0
pkgrel=2
pkgdesc="An extensible pomodoro timer"
arch=('x86_64')
url="https://github.com/metent/uair"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/metent/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('e49dc68b306936be486828a06597794a215d48ecc4db1d8982ab2291c03f86c5a8b6b3d149c2f0bfe134c5b252d024d8efc8fdeef94aeab8cbcf523c71496bf0')

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
