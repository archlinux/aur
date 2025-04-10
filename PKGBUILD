# Maintainer: Giovanni Scafora <scafora.giovanni@gmail.com>
pkgname=opgui
pkgver=0.12.3
pkgrel=1
pkgdesc='An USB programmer for various devices, including PIC, dsPIC, AVR microcontrollers, and various kinds of serial eeproms'
arch=('x86_64')
url='http://openprog.altervista.org'
license=('GPL-2.0-only')
depends=(gtk3)
source=(https://downloads.sourceforge.net/project/openprogrammer/OPGUI/${pkgname}_${pkgver}.tar.gz)
sha512sums=('d61748dc3ad0ffeb0efb2626582fe31a9d3b918bcd0a5b5593fa380f556435016f7953f3b32d50fd0b48aba44d1e9ac60153e2a8a7e4ba3a0125691f84fe5b2b')

build() {
	LDFLAGS+=' -Wl,-z,cet-report=none'
	cd ${pkgname}-${pkgver}
	sed -i "s/\$(CFLAGS)/\$(LDFLAGS) \$(CFLAGS)/g" Makefile
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make PREFIX="${pkgdir}/usr" DESTDIR="${pkgdir}" install
}
