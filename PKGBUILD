# Maintainer: Rishabh Das <rdas@tutanota.com>
pkgname='uair'
pkgver=0.3.1
pkgrel=1
pkgdesc="An extensible pomodoro timer"
arch=('x86_64')
url="https://github.com/metent/uair"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/metent/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('fbd22dfb685af1c3b0349b9f1631ebc72074cbb47fca7c2959a108cfae24ee2726ecb4cc789be173dffb78acd5802f0f88dc0e49a89ecd709c0c8e784b66e669')

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
