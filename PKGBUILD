# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=libots
pkgver=0.5.0
pkgrel=3
pkgdesc='Open Text Summarizer'
url='http://libots.sourceforge.net/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxml2' 'glib2')
options=('!libtool' '!makeflags')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/ots-${pkgver}.tar.gz")
sha1sums=('4468bc06470734848c2369a37c84f76ca4ac3f9a')


build() {
	cd "${srcdir}/ots-${pkgver}"
	touch gtk-doc.make
	sed -i -e 's/en.xml$//' dic/Makefile.am
	libtoolize --force
	aclocal
	automake --add-missing --force
	autoconf
	./configure --prefix=/usr --disable-static
	make
}

package() {
	cd "${srcdir}/ots-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
