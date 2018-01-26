# Maintainer: Ivy Foster <code@escondida.tk>

pkgbase=frotz-git
pkgname=(frotz-ncurses-git frotz-dumb-git)
pkgver=2.44.r196.gf3ceac9
pkgrel=1
pkgdesc='Z-machine interpreter for interactive fiction games'

arch=(i686 x86_64)
url='http://frotz.sourceforge.net/'
license=(GPL)
source=('git+https://github.com/DavidGriffith/frotz')
md5sums=(SKIP)

pkgver() {
	cd frotz
	git describe | sed 's@-\(.*\)-@.r\1.@'
}

prepare() {
	cd frotz
	sed '/^PREFIX/ s:/usr/local:/usr:
		/^MAN_PREFIX/ s:$:/share:
		' -i Makefile
}

build() {
	cd frotz
	make OPTS="$CFLAGS $LDFLAGS"
	make OPTS="$CFLAGS $LDFLAGS" dumb 
}

package_frotz-ncurses-git() {
	conflicts=(frotz)
	provides=(frotz)
	depends=('ncurses')

	cd frotz
	make DESTDIR="$pkgdir" install
}

package_frotz-dumb-git() {
	conflicts=(frotz-dumb)
	provides=(frotz-dumb)

	cd frotz
	make DESTDIR="$pkgdir" install_dumb
}
