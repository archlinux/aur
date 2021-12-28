# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=seisan2mseed
pkgver=1.8
pkgrel=1
pkgdesc="Convert SEISAN seismic time series to miniSEED."
arch=("x86_64")
url="https://github.com/iris-edu/seisan2mseed"
license=('GPL3')
depends=('libmseed')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5718833b596ace210369aa2fb33491edd08c872a4fc42632a8d4febe0db90f6f')

prepare() {
	cd "${pkgname}-${pkgver}/src"
	sed -i 's|GCCFLAGS = -O2 -Wall -I../libmseed||' Makefile
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
	cp seisan2mseed ${pkgdir}/usr/bin/
	cp doc/seisan2mseed.1 ${pkgdir}/usr/share/man/man1/
}
# vim:set ts=4 sw=4:
