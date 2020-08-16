# Maintainer: cobalt <jpt@mail.ru>
pkgname=jamin
pkgver=0.98.9
pkgrel=1
pkgdesc="A JACK Audio Connection Kit Audio Mastering interface"
arch=('i686' 'x86_64')
url="http://jamin.sourceforge.net/"
license=('GPL')
depends=('jack' 'libxml2' 'gtk3' 'swh-plugins' 'fftw' 'liblo')
makedepends=('perl-xml-parser' 'ladspa' 'intltool')
conflicts=('jamin-gtk2' 'jamin-cvs')
provides=('jamin')
options=('!libtool')
install=${pkgname}.install
source=('jamin-code::git+https://git.code.sf.net/p/jamin/code')
md5sums=('SKIP')

build() {
	LDFLAGS="-ldl"
	CFLAGS="-Wno-deprecated-declarations -Wno-pointer-sign -Wno-cpp -Wno-unused-but-set-variable -Wno-incompatible-pointer-types -Wno-unused-variable -fcommon"
	cd ${srcdir}/jamin-code
	./autogen.sh --prefix=/usr --libdir=/usr/lib
	make
}

package() {
	cd ${srcdir}/jamin-code
	make DESTDIR=${pkgdir} install
}
