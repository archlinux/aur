# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=gse2mseed
pkgver=1.13
pkgrel=1
pkgdesc="Convert GSE 2.x/IMS 1.x seismic time series to miniSEED."
arch=("x86_64")
url="https://github.com/iris-edu/gse2mseed"
license=('GPL3')
depends=('libmseed')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('847dc5554cc10a0cecb2bd6662702268aff2815ddf19c4520f7b9dc3510ee0d3')

prepare() {
	cd "${pkgname}-${pkgver}/src"
	sed -i 's|GCCFLAGS = -g -O2 -Wall -I../libmseed||' Makefile
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
	cp gse2mseed ${pkgdir}/usr/bin/
	cp doc/gse2mseed.1 ${pkgdir}/usr/share/man/man1/
}
# vim:set ts=4 sw=4:
