# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ascii2mseed
pkgver=1.5
pkgrel=1
pkgdesc="Convert ASCII seismic time series to miniSEED."
arch=("x86_64")
url="https://github.com/iris-edu/ascii2mseed"
license=('GPL3')
depends=('libmseed')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ad31e6011b14fef68ecf10e2176829510d660572fd8e9c02581e33625c2bbe4c')

prepare() {
	cd "${pkgname}-${pkgver}/src"
	sed -i 's|CFLAGS += -I../libmseed||' Makefile
	sed -i 's|LDFLAGS = -L../libmseed||' Makefile
}

build() {
	cd "${pkgname}-${pkgver}/src"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -d ${pkgdir}/usr/{bin,share/man/man1}
	cp ascii2mseed ${pkgdir}/usr/bin/
	cp doc/ascii2mseed.1 ${pkgdir}/usr/share/man/man1/
}
# vim:set ts=4 sw=4:
