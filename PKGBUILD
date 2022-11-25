#Maintainer: Rein Fernhout (LevitatingBusinessMan) <me@levitati.ng>

pkgname=catbin
pkgver=r58.d4ceec8
arch=("x86_64")
pkgrel=1
pkgdesc="A pastebin server meant for the terminal"
license=("MIT")
depends=("leveldb" "libmicrohttpd")
makedepends=("make")
url="https://github.com/LevitatingBusinessMan/$pkgname"
source=("git+https://github.com/LevitatingBusinessMan/$pkgname.git")
sha256sums=("SKIP")

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
	mkdir -pv "$pkgdir/var/lib/catbind"
	DESTDIR="$pkgdir" PREFIX="/usr" make install
}
