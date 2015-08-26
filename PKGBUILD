# Maintainer: Matt Monaco <net 0x01b matt>

pkgname=xwiimote-git
pkgver=xwiimote.2
pkgrel=1
pkgdesc="Open Source Nintendo Wii Remote Linux Device Driver"
url="http://dvdhrm.github.io/xwiimote"
license=(MIT)
arch=(i686 x86_64)
depends=(ncurses udev)
makedepends=(git)
conflicts=(xwiimote)
provides=(xwiimote)
backup=(etc/X11/xorg.conf.d/50-fix-xwiimote.conf)
source=(git://github.com/dvdhrm/xwiimote.git)
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/xwiimote"
	local ver=$(git describe --tags )
	echo ${ver//-/.}
}

prepare() {
	cd "$srcdir/xwiimote"
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd "$srcdir/xwiimote"
	./configure --prefix=/usr --with-doxygen=no
	make
}

package() {
	cd "$srcdir/xwiimote"
	make DESTDIR="$pkgdir" install
	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/xwiimote/LICENSE"
	install -m644 -D "res/50-xorg-fix-xwiimote.conf" "$pkgdir/etc/X11/xorg.conf.d/50-fix-xwiimote.conf"
}
