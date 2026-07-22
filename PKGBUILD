# Maintainer: Omar Stefano Valentini <omarvalentini@proton.me>

_pkgname="gitstore"
pkgname="${_pkgname}-git"
pkgver=0.0.0.12
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
	echo "0.0.0.$(git rev-list --count HEAD)"
}

build() {
	cd "$_pkgname" || exit 1
	make
}

package() {
	cd "$_pkgname" || exit 1
	make install DESTDIR="$pkgdir" prefix="/usr/share" exec_prefix="/usr/bin"
}
