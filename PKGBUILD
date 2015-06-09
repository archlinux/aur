# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=dri2proto
pkgname=$_pkgname-git
pkgver=2.8.3.gddc1287
pkgrel=1
pkgdesc="X11 DRI extension wire protocol."
url="https://wiki.freedesktop.org/xorg/"
arch=("any")
license=("custom")
makedepends=("git" "xorg-util-macros")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git://git.freedesktop.org/git/xorg/proto/$_pkgname")
sha256sums=("SKIP")


pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s|dri2proto.||g;s|-|.|g"
}

build() {
	cd "$srcdir/$_pkgname"

	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_pkgname"

	make DESTDIR="$pkgdir" install
	install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
