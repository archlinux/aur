pkgname=macopix-cloudef
pkgver=1.7.4+cloudef8
pkgrel=1
pkgdesc="Mascot Constructive Pilot for X – Cloudef's fork"
url="https://github.com/Cloudef/macopix-fork"
arch=(i686 x86_64)
license=(GPL2 LGPL2.1)
depends=(gtk2 openssl)
provides=(macopix=$pkgver)
conflicts=(macopix)
source=("git+https://github.com/Cloudef/macopix-fork")
sha256sums=('SKIP')

pkgver() {
	cd macopix-fork
	echo 1.7.4+cloudef$(git rev-list --count HEAD)
}

build() {
	cd macopix-fork
	./configure --prefix=/usr
	make LDFLAGS+="-lX11"
}

package() {
	cd macopix-fork
	make DESTDIR="$pkgdir" install
	mkdir -p "$pkgdir"/usr/share/macopix/pixmap
}
