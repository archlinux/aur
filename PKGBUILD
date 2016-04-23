pkgname=jamin-cvs
pkgver=0.98.3
pkgrel=6
pkgdesc="A JACK Audio Connection Kit Audio Mastering interface"
arch=('i686' 'x86_64')
url="http://jamin.sourceforge.net/"
license=('GPL')
depends=('jack' 'libxml2' 'gtk2' 'swh-plugins' 'fftw' 'liblo')
makedepends=('perl-xml-parser' 'ladspa' 'cvs' 'intltool')
conflicts=('jamin')
provides=('jamin')
options=('!libtool')
install=${pkgname}.install
source=()
md5sums=()

build() {
	LDFLAGS="-ldl"
	cd "$srcdir"
	msg ""
	msg ""
	msg "Connecting to svs server ..."
	msg ""
	msg "Press ENTER when asked for password"
	cvs -d:pserver:anonymous@jamin.cvs.sourceforge.net:/cvsroot/jamin login
	cvs -z3 -d:pserver:anonymous@jamin.cvs.sourceforge.net:/cvsroot/jamin co -P jamin


	cd ${srcdir}/jamin
	./autogen.sh --prefix=/usr --libdir=/usr/lib
	make
}

package() {
	cd ${srcdir}/jamin
	make DESTDIR=${pkgdir} install
}
