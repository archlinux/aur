# Maintainer: Omar Stefano Valentini <omarvalentini@proton.me>

_pkgname="yankbase"
pkgname="${_pkgname}-git"
pkgver=0.1r0.g02d36e2
pkgrel=1
pkgdesc="A git-based universal text snippet manager"
url="https://codeberg.org/ValOm/yankbase"

arch=("any")
depends=("gitstore" "xdg-terminal-exec")
makedepends=("git" "make" "scdoc" "gzip")
license=("BSD")

source=("git+$url")
md5sums=("SKIP")

provides=( "$_pkgname" )

pkgver() {
	cd "$srcdir/$_pkgname" || exit 1
	git describe --tags --long | sed '{ s/^v//; s/-/r/; s/-/./}'
}

check() {
	cd "$srcdir/$_pkgname" && make test
}

build() {
	cd "$_pkgname" || exit 1
	make build
}

package() {
	cd "$_pkgname" || exit 1
	make install DESTDIR="$pkgdir" prefix="/usr"
}
