# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=althttpd-fossil
pkgver=r16.2c5e3f9
pkgrel=1
pkgdesc="The Althttpd Webserver"
arch=('x86_64')
url='https://sqlite.org/althttpd/'
license=('custom:Public Domain')
depends=('gcc-libs')
makedepends=('fossil' 'gcc' 'make')
provides=('althttpd')
conflicts=('althttpd')
source=("fossil+https://sqlite.org/althttpd")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/althttpd"
	_hash=$(fossil info | sed -n 's/checkout: *\([0-9a-z]*\).*/\1/p' | cut -c 1-7)
	_revision=$(fossil info | sed -n 's/check-ins: *\(.*\)/\1/p')
	printf "r%s.%s" "$_revision" "$_hash"
}

build() {
	cd "${srcdir}/althttpd"
	make
}

package() {
	cd "${srcdir}/althttpd"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/licenses/althttpd"
	mkdir -p "$pkgdir/usr/share/doc/althttpd"
	install -Dm755 "althttpd" "$pkgdir/usr/bin/"
	install -Dm644 "althttpd.md" "$pkgdir/usr/share/doc/althttpd/"
	head -n 10 althttpd.c > "$pkgdir/usr/share/licenses/althttpd/LICENSE"
}
