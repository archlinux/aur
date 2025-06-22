# Maintainer: Giovanni Scafora <scafora.giovanni@gmail.com>
pkgname=opgui
pkgver=0.12.4
pkgrel=1
pkgdesc='An USB programmer for various devices, including PIC, dsPIC, AVR microcontrollers, and various kinds of serial eeproms'
arch=('x86_64')
url='http://openprog.altervista.org'
license=('LGPL-2.0-or-later')
depends=(gtk3)
source=(https://downloads.sourceforge.net/project/openprogrammer/OPGUI/${pkgname}_${pkgver}.tar.gz)
sha512sums=('8b8014a7213e64983c46354f83e41c166bced0e5bbeda82ebb9c05e1b5eb81c88b24f87076a53d77aa924ac56606d92b3404b870846c02f64a865d854bc0641a')

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
