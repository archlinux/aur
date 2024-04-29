# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=poe
pkgver=1.8.0
pkgrel=1
pkgdesc=".po file editor"
arch=('x86_64')
url="https://strahinja.srht.site/poe"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/poe/archive/v$pkgver.tar.gz")
md5sums=('5635e59db3e4f1cd7e87b0ea9e9e65ec')

build() {
	cd "${pkgname}-v$pkgver"

	# Some build environments insist on having those preset, which breaks
	# the build; if you really want some of them, comment the 'unset' lines
	# below, but note you are on your own wrt errors.
	unset BINDIR CC CFLAGS CPPFLAGS DOCDIR HEADERS INSTALL LDFLAGS LIBS
	unset MANPAGE MANPREFIX OBJS PROG SRC 

	make FALLBACKVER="${pkgver}-$pkgrel" DESTDIR="$pkgdir" PREFIX="/usr" all
}

package() {
	cd "${pkgname}-v$pkgver"

	unset BINDIR CC CFLAGS CPPFLAGS DOCDIR HEADERS INSTALL LDFLAGS LIBS
	unset MANPAGE MANPREFIX OBJS PROG SRC 

	make FALLBACKVER="${pkgver}-$pkgrel" DESTDIR="$pkgdir" PREFIX="/usr" \
		install
}
