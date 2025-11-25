# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=slweb
pkgver=0.10.2
pkgrel=1
pkgdesc="Simple static website generator"
arch=('x86_64')
url="https://strahinja.srht.site/slweb"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/slweb/archive/v$pkgver.tar.gz")
md5sums=('083a6aa005866355807d866d56f41089')
optdepends=(
	'katex: For math mode'
	'git: For {git-log}'
	'imagemagick: For img tag attributes'
)

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
