# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>

pkgname=zesarux
pkgver=3.1
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
md5sums=('7bc53b79b035693d76514ee79a2b80a3')
install="zesarux.install"

build() {
	cd "${srcdir}/ZEsarUX-${pkgver}"
	./configure --prefix /usr --disable-aa --disable-caca
	make
}
package(){
	if [  ! -d "${pkgdir}/usr" ]; then
		mkdir -p "${pkgdir}/usr/bin"
		mkdir -p "${pkgdir}/usr/share/zesarux/"
	fi
	cd ${srcdir}/ZEsarUX-${pkgver}
	cp zesarux "${pkgdir}/usr/bin/"
	cp *.rom zxuno.flash *.mmc ${pkgdir}/usr/share/zesarux/
	cp mantransfev3.bin ${pkgdir}/usr/share/zesarux/
	
	#cp -r festival_speech_filters ${pkgdir}/usr/share/zesarux/
	cp -r tapes_snaps_eproms ${pkgdir}/usr/share/zesarux/
	cp ACKNOWLEDGEMENTS Changelog HISTORY LICENSE README FEATURES ALTERNATEROMS INCLUDEDTAPES FAQ ${pkgdir}/usr/share/zesarux/
	find ${pkgdir}/usr/share/zesarux/ -type f -print0| xargs -0 chmod 444
	#chmod +x ${pkgdir}/usr/share/zesarux/macos_say_filter.sh
	#chmod +x ${pkgdir}/usr/share/zesarux/festival_speech_filters/*
}
