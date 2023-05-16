# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=naken_asm
pkgver=2023.01.11
pkgrel=1
pkgdesc="Assembler for MSP430, dsPIC, ARM, MIPS, 65xx, 68000, 8051/8052, Atmel AVR8, and others"
url=http://www.mikekohn.net/micro/naken_asm.php
license=(GPL3)
arch=(i686 x86_64)
depends=(readline)
conflicts=(naken_asm-git)
options=(!lto)
_pkgver=${pkgver//./-}
source=("http://www.mikekohn.net/downloads/${pkgname}/${pkgname}-${_pkgver}.tar.gz")
b2sums=('593182a596585cc0aefa3bee837bf19dfc9cf33a9233aa1b98128b06cf0869c5b803b310e32d2b9304378f508e95a6b49a68eb54cf48591e02df576758eede39')

build () {
	cd "${pkgname}-${_pkgver}"
	./configure --install-prefix="${pkgdir}/usr" \
		--include-path="/usr/share/${pkgname}/includes" \
		--cflags="$CFLAGS" --ldflags="$LDFLAGS"
	make
}

package () {
	cd "${pkgname}-${_pkgver}"
	make install
}
