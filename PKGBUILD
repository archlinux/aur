#Maintainer: Rein Fernhout (LevitatingBusinessMan) <me@levitati.ng>
pkgname=catbin-git
pkgver=r64.e4334fa
arch=("x86_64")
pkgrel=1
pkgdesc="A pastebin server meant for the terminal. A clone of termbin.com (fiche)."
license=("MIT")
depends=("leveldb" "libmicrohttpd")
makedepends=("make")
url="https://github.com/LevitatingBusinessMan/catbin"
source=("$pkgname::git+https://github.com/LevitatingBusinessMan/catbin.git")
sha256sums=("SKIP")
provides=("catbin")

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	DESTDIR="$pkgdir" PREFIX="/usr" make install
	mv "$pkgdir/usr/etc" "$pkgdir/etc/"
	mkdir -pv "$pkgdir/var/lib/catbind"
}
