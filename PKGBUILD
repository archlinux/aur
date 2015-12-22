# Contributor: Sebastian Wolf <fatmike303 at gmail.com>
pkgname=gavrasm
pkgver=3.5
_pkgver=35
_pkgver2=3_5
pkgrel=1
pkgdesc="Command line assembler for Atmel AVR microcontrollers with many extended features"
arch=(i686 x86_64)
license=("Custom")
url="http://www.avr-asm-tutorial.net/gavrasm"
makedepends=("fpc")
source=("http://www.avr-asm-tutorial.net/${pkgname}/v${_pkgver}/${pkgname}_sources_lin_${_pkgver}.zip")
sha256sums=(c9749c771da51a7d161662e19a22f35712c743811b1b6a94b48f00300b351413)

build() {
	cd "${srcdir}/Sourcefiles_v${_pkgver2}"
	ln -s gavrlang_en.pas gavrlang.pas
	fpc gavrasm.pas || return 1
}

package() {
	cd "${srcdir}/Sourcefiles_v${_pkgver2}"
	install -D gavrasm ${pkgdir}/usr/bin/gavrasm
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    sed -n '/Terms of use/,/ error file./p' ReadMe.Txt > ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
