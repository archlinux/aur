# Maintainer: Gaetan Bisson <bisson@archlinux.org

pkgname=squishyball
pkgver=19599
pkgrel=1
pkgdesc='Perform sample comparison testing on the command line'
url='https://svn.xiph.org/trunk/squishyball/'
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('subversion')
depends=('opusfile' 'ncurses' 'libvorbis' 'flac' 'libao')
source=("svn+https://svn.xiph.org/trunk/squishyball/")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	svn info | awk '/Revision/{print $2}'
}

build() {
	cd "${srcdir}/${pkgname}"
	sed 's:@MANDIR@:/usr/share/man:' -i Makefile.am
	./autogen.sh --prefix='/usr'
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
