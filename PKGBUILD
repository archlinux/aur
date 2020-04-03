pkgname="buici-clock"
pkgver="0.4.9.4"
pkgrel=3
pkgdesc="A minimalistic clock for X"
arch=("x86_64" "i686")
license=("GPL v2")

depends=('xorg-server-devel' 'xorg-xprop')
makedepends=("m4")

source=(
	"http://http.debian.net/debian/pool/main/b/buici-clock/buici-clock_0.4.9.4.tar.xz"
	"fix-second-hand.diff"
)
sha256sums=(
	"f5138d220568e3ba5afd272c61a63e5a1a0009a6023387d2a0cbf15af9b3649f"
	"78a6a5ec40e30af30ededb6ac11bc08f934596f86cfd0fbe70f50407bafdb3a0"
)

build() {
	cd "$srcdir/buici"
	patch -p1 < "$srcdir/fix-second-hand.diff"
	./configure --prefix=/usr
#	make _version.h
	make #-j8
}

package() {
	cd "$srcdir/buici"
	make DESTDIR="$pkgdir/" install
}
