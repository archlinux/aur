# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libots
pkgver=0.5.0
pkgrel=4
pkgdesc='Open Text Summarizer'
url='https://libots.sourceforge.net/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxml2' 'glib2' 'popt')
# disappeared from sourceforge as of 2017-03-01, unclear what new upstream should be
source=("https://downloads.sourceforge.net/sourceforge/${pkgname}/ots-${pkgver}.tar.gz")
sha1sums=('4468bc06470734848c2369a37c84f76ca4ac3f9a')

options=('!makeflags')

prepare() {
	cd "${srcdir}/ots-${pkgver}"
	touch gtk-doc.make
	sed 's/en.xml$//' -i dic/Makefile.am
	libtoolize --force
	aclocal
	automake --add-missing --force
	autoconf
}

build() {
	cd "${srcdir}/ots-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/ots-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
