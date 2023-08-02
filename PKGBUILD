# Maintainer: Steven! Ragnarök <steven@nuclearsandwich.com>
pkgname=oils-for-unix
pkgver=0.17.0
pkgrel=1
pkgdesc="A collection of Unix shells and utilities."
arch=('x86_64')
url="https://www.oilshell.org"
license=('Apache-2.0')
depends=(readline)
makedepends=(bash readline)
source=("https://www.oilshell.org/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ca1bae85b9d45129527c766eb7f9d61d377388f693c695c82a76a4fbc8fb7371')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	# If the current working directory (.) is on your PATH, then this takes
	# precedence over the `install` utility and creates a recursive call to
	# itself.
	mv install install-ofu
	_build/oils.sh
}

check() {
	cd "$pkgname-$pkgver"
	true # Not sure how to run tests yet.
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" sh -x ./install-ofu 
}
