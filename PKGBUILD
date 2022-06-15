# Maintainer: Ethan Cheng <ethanrc0528 at gmail dot com>
pkgname='utf-8-steg-git'
pkgver=0.1.3.r0.g04ed9a1
pkgrel=1
pkgdesc="Encodes/decodes data into zero-width utf-8 characters"
arch=(any)
url="https://github.com/yadayadajaychan/utf-8-steg"
license=('GPL3')
depends=()
makedepends=('git' 'gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=(git+https://github.com/yadayadajaychan/utf-8-steg.git?signed#branch=master)
md5sums=('SKIP')
validpgpkeys=(1624691AAB618B49D8AE10BE046F1347562492CC)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	gcc main.c -o utf-8-steg
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	mv "$srcdir/${pkgname%-git}/utf-8-steg" "$pkgdir/usr/bin"
	ln -rsT "$pkgdir/usr/bin/utf-8-steg" "$pkgdir/usr/bin/steg"

	mkdir -p "$pkgdir/usr/share/man/man1"
	cp "$srcdir/${pkgname%-git}/utf-8-steg.1" "$pkgdir/usr/share/man/man1/"
}
