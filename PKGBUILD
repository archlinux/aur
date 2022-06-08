# Maintainer: Ethan Cheng <ethanrc0528 at gmail dot com>
pkgname='utf-8-steg-git'
pkgver=0.0.0
pkgrel=1
pkgdesc="Encodes/decodes data into zero-width utf-8 characters"
arch=(any)
url="https://github.com/yadayadajaychan/utf-8-steg"
license=('GPL3')
depends=()
makedepends=('git' 'gcc')
provides=("${pkgname%-git}" 'steg')
conflicts=("${pkgname%-git}")

_tag=05f8b7df05d5f007cd8a5e45b30de6f8dc04a34e
source=(git+https://github.com/yadayadajaychan/utf-8-steg.git?signed#tag=$_tag)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe
}

build() {
	cd "$srcdir/${pkgname%-git}"
	gcc main.c -o utf-8-steg
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/${pkgname%-git}/utf-8-steg" "$pkgdir/usr/bin"
	ln -rsT "$pkgdir/usr/bin/utf-8-steg" "$pkgdir/usr/bin/steg"
}
