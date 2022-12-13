# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Gordon JC Pearce <gordon@gjcp.net>
# Contributor: Chuck Atkins <chuckatkins@gmail.com>
# Original Submitter: Bob Finch <w9ya@qrparci.net)

pkgname=ax25-apps
pkgver=0.0.8_rc5
_pkgver=${pkgver//_/-}
pkgrel=6
pkgdesc="Programs for the Amateur (Ham) Radio protocol AX.25."
arch=('i686' 'x86_64')
url='https://linux-ax25.in-berlin.de'
license=('GPL2')
depends=('libax25' 'ncurses')
install=$pkgname.install
backup=('etc/ax25/ax25ipd.conf' 'etc/ax25/ax25mond.conf'\
	'etc/ax25/ax25rtd.conf')
source=("https://linux-ax25.in-berlin.de/pub/$pkgname/$pkgname-$_pkgver.tar.xz")

prepare () {
	cd $srcdir/$pkgname-$_pkgver
	sed -i -e "s#ncursesw/ncurses.h#ncurses.h#" call/call.c
}

build() {
	cd $srcdir/$pkgname-$_pkgver
	./configure --prefix=/usr --sysconfdir=/etc \
	--localstatedir=/var/cache --sbindir=/usr/bin
	make clean
	make
}

package() {
	cd $srcdir/$pkgname-$_pkgver
	make install DESTDIR=$pkgdir
	make installconf DESTDIR=$pkgdir
}
md5sums=('3625dcdfaa7aa1f6a0fdfe6b60874713')
sha256sums=('5071419bb3648594fa4b49190bb4c0c2ac4c9285ce0f80b2dacf8a2f9910dc4b')
