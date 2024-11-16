pkgbase=outils-split
pkgname=(outils-{apply,rdate})
pkgver=0.13
pkgrel=1
pkgdesc="OpenBSD tools ported via outils (split packages)"
arch=(x86_64)
url="https://github.com/leahneukirchen/outils"
license=(BSD)
depends=(glibc)
source=("outils-$pkgver.tar.gz::https://github.com/leahneukirchen/outils/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('49d46211fe84a5b96cf55d689696d190b7aba7d3e043c8c8dc9f5ff9af8f927a')

build() {
	cd outils-$pkgver
	make src/usr.bin/apply/apply
	sed "/#include/Q" src/usr.bin/apply/apply.c > LICENSE.apply
	make src/usr.sbin/rdate/rdate
	sed "/#include/Q" src/usr.sbin/rdate/rdate.c > LICENSE.rdate
}

package_outils-apply() {
	pkgdesc="OpenBSD 'apply' command, ported via outils"
	provides=(apply)
	conflicts=(apply outils)

	cd outils-$pkgver
	install -Dm0755 src/usr.bin/apply/apply "$pkgdir"/usr/bin/apply
	install -Dm0644 src/usr.bin/apply/apply.1 "$pkgdir"/usr/share/man/man1/apply.1
	install -Dm0644 LICENSE.apply "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_outils-rdate() {
	pkgdesc="OpenBSD rdate with SNTP support, ported via outils"
	provides=(rdate)
	conflicts=(rdate outils)

	cd outils-$pkgver
	install -Dm0755 src/usr.sbin/rdate/rdate "$pkgdir"/usr/bin/rdate
	install -Dm0644 src/usr.sbin/rdate/rdate.8 "$pkgdir"/usr/share/man/man8/rdate.8
	install -Dm0644 LICENSE.rdate "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
