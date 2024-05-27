# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=dtree
pkgver=0.2.6
pkgrel=1
pkgdesc="Command line program to draw trees"
arch=('x86_64')
url="https://strahinja.srht.site/dtree"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/dtree/archive/v$pkgver.tar.gz")
md5sums=('901c4eb6e88923882fa16aa76629a4e1')

build() {
	cd "${pkgname}-v$pkgver"
	
	# Some build environments insist on having those preset, which breaks
	# the build; if you really want some of them, comment the 'unset' lines
	# below, but note you are on your own wrt errors.
	unset BINDIR CC CFLAGS CPPFLAGS DOCDIR HEADERS INSTALL LDFLAGS LIBS
	unset MANPAGE MANPREFIX OBJS PROG SRC 

	make FALLBACKVER=${pkgver}-$pkgrel DESTDIR="$pkgdir" PREFIX="/usr" all
}

package() {
	cd "${pkgname}-v$pkgver"

	unset BINDIR CC CFLAGS CPPFLAGS DOCDIR HEADERS INSTALL LDFLAGS LIBS
	unset MANPAGE MANPREFIX OBJS PROG SRC 

	make FALLBACKVER=${pkgver}-$pkgrel DESTDIR="$pkgdir" PREFIX="/usr" \
		install
}
