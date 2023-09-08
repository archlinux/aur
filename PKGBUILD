# Maintainer: Ethan Cheng <ethanrc0528 at gmail dot com>
pkgname='zwc-git'
pkgver=0.1.0.r1.gac8f6ac
pkgrel=1
pkgdesc="Encodes/decodes data into zero-width utf-8 characters"
arch=(any)
url="https://github.com/yadayadajaychan/zwc"
license=('GPL3')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=(git+$url.git?signed#branch=testing)
cksums=('SKIP')
validpgpkeys=(1624691AAB618B49D8AE10BE046F1347562492CC)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -m 755 "$srcdir/${pkgname%-git}/zwc" "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/usr/share/man/man1"
	install -m 644 "$srcdir/${pkgname%-git}/doc/zwc.1" "$pkgdir/usr/share/man/man1/"

	mkdir -p "$pkgdir/usr/share/man/man5"
	install -m 644 "$srcdir/${pkgname%-git}/doc/zwc.5" "$pkgdir/usr/share/man/man5/"
}
