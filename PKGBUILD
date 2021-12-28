# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=datafilter
pkgver=1.0
pkgrel=1
pkgdesc="A simple program for selection filtering and organization for data in miniSEED format."
arch=("x86_64")
url="https://github.com/iris-edu/${pkgname}"
license=('GPL3')
depends=('libmseed')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('965fd46199f9f2ea19dd1aee2c97e874a9ef02726adc2448b2b3daf2bc235501')

prepare() {
	cd "${pkgname}-${pkgver}/src"
	sed -i 's|REQCFLAGS = -I../libmseed||' Makefile
	sed -i 's|LDFLAGS = -L../libmseed||' Makefile
}

build() {
	cd "${pkgname}-${pkgver}/src"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -d ${pkgdir}/usr/{bin,share/man/man1}
	cp ${pkgname} ${pkgdir}/usr/bin/
	cp doc/${pkgname}.1 ${pkgdir}/usr/share/man/man1/
}
# vim:set ts=4 sw=4:
