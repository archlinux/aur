# Maintainer: Kyle <kyle@gmx.ca>
# Contributer: Storm Dragon <stormdragon2976@gmail.com>

pkgname=espeak-test
pkgver=1.48.15
pkgrel=1
pkgdesc="Text to Speech engine for good quality English, with support for other languages: latest test version"
arch=('i686' 'x86_64')
url="http://espeak.sourceforge.net/test/latest.html"
license=('GPL')
depends=('gcc-libs' 'portaudio')
conflicts=('espeak')
provides=('espeak')
source=(http://espeak.sourceforge.net/test/espeak-$pkgver.zip)
md5sums=('a933baef9cd6528f2e019e59582797bd')

# Extracted dir sometimes has different version number from $pkgver and zip file. Fixed when necessary.
#prepare() {
#	mv ${srcdir}/espeak-1.48.01 ${srcdir}/espeak-${pkgver}
#}

build() {
	cd $srcdir/espeak-${pkgver}/src
	cp portaudio19.h portaudio.h
	sed -i 's/\#AUDIO\ =\ runtime/AUDIO\ =\ runtime/' Makefile
	sed -i 's/AUDIO\ =\ portaudio/\#AUDIO\ =\ portaudio/' Makefile
	make
}

package() {
	cd $srcdir/espeak-${pkgver}/src
	make DESTDIR=$pkgdir install
	find "$pkgdir/usr/share/espeak-data" -type f -print0 |xargs -0 chmod 644
}
