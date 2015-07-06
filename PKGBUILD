# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>

pkgname=zesarux
pkgver=3.0
pkgrel=1
pkgdesc="A Zx80/Zx81/Z88, Zx Spectrum 16/48/128/+2/+2A and ZX-Uno emulator with ULAPlus support"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/zesarux/"
license=('GPL3')
conflicts=('zesarux-git')
depens=('lesstif')
optdepends=('pulseaudio: for support Pulseaudio'
	'openssl: for enable SSL functions')
	
source=("http://sourceforge.net/projects/zesarux/files/ZEsarUX-${pkgver}/ZEsarUX_src-${pkgver}.tar.gz")
md5sums=('6a670e31af81d4482e0675d4fdfd2e2d')

build() {
	cd "${srcdir}/ZEsarUX-${pkgver}"
	./configure --prefix /usr --disable-caca --disable-aa --disable-xext
	make
}
package(){
	if [  ! -d "${pkgdir}/usr" ]; then
		mkdir -p "${pkgdir}/usr/bin"
		mkdir -p "${pkgdir}/usr/share/zesarux/"
	fi
	cd ${srcdir}/ZEsarUX-${pkgver}
	cp zesarux "${pkgdir}/usr/bin/"
	cp *.rom "${pkgdir}/usr/share/zesarux/"
	cp -r tapes "${pkgdir}/usr/share/zesarux/"
	cp ACKNOWLEDGEMENTS Changelog HISTORY LICENSE README FEATURES INSTALL ALTERNATEROMS INCLUDEDTAPES "${pkgdir}/usr/share/zesarux/"
	find "${pkgdir}/usr/share/zesarux/" -type f -print0| xargs -0 chmod 444
}
