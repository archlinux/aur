# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>

pkgname=zesarux
pkgver=9.2
pkgrel=1
pkgdesc="A Zx80/Zx81/Z88, Zx Spectrum 16/48/128/+2/+2A and ZX-Uno emulator with ULAPlus support"
arch=('i686' 'x86_64')
url="https://github.com/chernandezba/zesarux"
license=('GPL3')
conflicts=('zesarux-git')
depens=(sdl)
optdepends=('pulseaudio: for support Pulseaudio'
	'openssl: for enable SSL functions'
	'sdl: for support sdl video and audio output')
source=("https://github.com/chernandezba/zesarux/releases/download/${pkgver}/ZEsarUX_src-${pkgver}.tar.gz")
md5sums=('d8be66ebd9ea88a8eb1a2b446a878605')
install="zesarux.install"

build() {
	cd "${srcdir}/ZEsarUX-${pkgver}"
	./configure --prefix /usr --enable-memptr --enable-visualmem --enable-cpustats
	sed -i 's/tar -C/#tar -C/g' Makefile
	make bintargz
}
package(){
	if [  ! -d "${pkgdir}/usr" ]; then
		mkdir -p "${pkgdir}/usr/bin"
		mkdir -p "${pkgdir}/usr/share/zesarux/"
	fi
	cd ${srcdir}/ZEsarUX-${pkgver}
	cp zesarux "${pkgdir}/usr/bin/"
	cp bintargztemp/ZEsarUX-${pkgver}/* -r "${pkgdir}/usr/share/zesarux/"
	rm "${pkgdir}/usr/share/zesarux/zesarux"
}
