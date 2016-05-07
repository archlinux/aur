# Maintainer: ohizou <ohizougg9[a_t}gmail.com>

pkgname=kasumi-cvs
_pkgname=kasumi
pkgver=2.5
pkgrel=1
pkgdesc="A personal dictionary manager for Anthy"
url="https://en.osdn.jp/projects/kasumi/"
arch=(any)
licence=('GPL2')
#depends=('anthy' 'atk' 'cairo' 'gdk-pixbuf2' 'pango' 'gtk2' 'fontconfig' 'freetype2')
depends=('anthy' 'gtk2' )
makedepends=('cvs')
provides=('kasumi')
conflicts=('kasumi')

source=()
md5sums=()

prepare() {
	cd ${srcdir}
	#cvs -d:pserver:anonymous@cvs.sourceforge.jp:/cvsroot/kasumi login
	cvs -z3 -d:pserver:anonymous@cvs.sourceforge.jp:/cvsroot/kasumi co kasumi2
	cd ${srcdir}/kasumi2
	./autogen.sh
	./configure --prefix=/usr
}

pkgver() {
	cd ${srcdir}/kasumi2
	grep "#define[[:space:]]*VERSION[[:space:]]*" < config.h | egrep -o '[0-9][^"]+'
}

build() {
	cd ${srcdir}/kasumi2
	make
}

package() {
	cd ${srcdir}/kasumi2
	make DESTDIR="${pkgdir}" install
}
