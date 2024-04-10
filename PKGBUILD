# Maintainer: Giovanni Scafora <scafora.giovanni@gmail.com>
pkgname=opgui
pkgver=0.12.2
pkgrel=3
pkgdesc='An USB programmer for various devices, including PIC, dsPIC, AVR microcontrollers, and various kinds of serial eeproms'
arch=('x86_64')
url='http://openprog.altervista.org'
license=('GPL-2.0-only')
depends=(gtk3)
source=(https://downloads.sourceforge.net/project/openprogrammer/OPGUI/${pkgname}_${pkgver}.tar.gz)
sha512sums=('e6de138a36f66ce60d047966c83466b4a27510933b69311f90d0fd1e374a11b3512d631625697aa760b38272f3bb660bd87bc08f1330bb21cb954abfce16553e')

build() {
	cd ${pkgname}-${pkgver}
	sed -i "s/\$(CFLAGS)/\$(LDFLAGS) \$(CFLAGS)/g" Makefile
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make PREFIX="${pkgdir}/usr" DESTDIR="${pkgdir}" install
}
