# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>

pkgname=zesarux
pkgver=7.1
pkgrel=1
pkgdesc="A Zx80/Zx81/Z88, Zx Spectrum 16/48/128/+2/+2A and ZX-Uno emulator with ULAPlus support"
arch=('i686' 'x86_64')
url="https://github.com/chernandezba/zesarux"
license=('GPL3')
conflicts=('zesarux-git')
depens=('lesstif')
optdepends=('pulseaudio: for support Pulseaudio'
	'openssl: for enable SSL functions'
	'sdl: for support sdl video and audio output')
source=("https://github.com/chernandezba/zesarux/releases/download/${pkgver}-final/ZEsarUX_src-${pkgver}.tar.gz")
md5sums=('bf3787fb2fbe7840398ed5ab9a46cfb5')
install="zesarux.install"

build() {
	cd "${srcdir}/ZEsarUX-${pkgver}"
	./configure --prefix /usr --disable-aa --disable-caca
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
