# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=mseed2ascii
pkgver=2.6
pkgrel=1
pkgdesc="Convert miniSEED seismic time series to ASCII."
arch=("x86_64")
url="https://github.com/iris-edu/mseed2ascii"
license=('GPL3')
depends=('libmseed' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c0e0d8561567079171f6066c56256b67c43b544a78fc00f7b2cde5d3d490bea1')

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
	cp mseed2ascii ${pkgdir}/usr/bin/
	cp doc/mseed2ascii.1 ${pkgdir}/usr/share/man/man1/
}
# vim:set ts=4 sw=4:
