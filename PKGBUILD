pkgname=purple-hangouts-hg
srcname=purple-hangouts
pkgdesc='A Pidgin plugin to support the proprietary protocol used by Google for the Hangouts service.'
url='https://bitbucket.org/EionRobb/purple-hangouts'
arch=('i686' 'x86_64' 'armv6h')
pkgver=r386.cccf2f62d439
pkgrel=1
license=('GPLv3+')
depends=('libpurple' 'glib2' 'json-glib')
makedepends=('mercurial')
source=('purple-hangouts::hg+https://bitbucket.org/EionRobb/purple-hangouts')
md5sums=('SKIP')

pkgver() {
	cd $srcdir/$srcname
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd $srcdir/$srcname
	make
}

package() {
	cd $srcdir/$srcname
	destdir=$pkgdir$(pkg-config --variable plugindir purple)
	install -Dm755 -t $destdir libhangouts.so

	icondir=$pkgdir/usr/share/pixmaps/pidgin/protocols
	echo $icondir

	for size in 16 22 24 48; do
		install -TDm644 $srcdir/$srcname/hangouts$size.png $icondir/$size/hangouts.png
	done
}
