# Maintainer: Omar Stefano Valentini <omarvalentini@proton.me>

_pkgname="gitstore"
pkgname="${_pkgname}-git"
pkgver=1.2r3.g3ac2bf1
pkgrel=1
pkgdesc="Thin git-backed transactional store manager, inspired by pass."
url="https://codeberg.org/ValOm/gitstore"

arch=("any")
depends=("bash")
makedepends=("git" "make" "scdoc" "gzip")
license=("BSD")

source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname" || exit 1
	git describe --tags --long | sed '{ s/^v//; s/-/r/; s/-/./}'
}

check() {
	cd "$srcdir/$_pkgname" && make test
}

build() {
	cd "$_pkgname" || exit 1
	make
}

package() {
	cd "$_pkgname" || exit 1
	make install DESTDIR="$pkgdir" prefix="/usr"
}
