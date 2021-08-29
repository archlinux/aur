# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=mars2mseed
pkgver=1.4
pkgrel=1
pkgdesc="Convert MARS 88/lite seismic time series to miniSEED."
arch=("x86_64")
url="https://github.com/iris-edu/mars2mseed"
license=('GPL3')
depends=('libmseed')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('49acbf9d18c449379dc7ec2074f4e173f73519ceb4030eaa78175dd6d2f9420e')

prepare() {
	cd "${pkgname}-${pkgver}/src"
	sed -i 's|CFLAGS += -I../libmseed||' Makefile
	sed -i 's|LDFLAGS += -L../libmseed||' Makefile
}

build() {
	cd "${pkgname}-${pkgver}/src"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -d ${pkgdir}/usr/{bin,share/man/man1}
	cp mars2mseed ${pkgdir}/usr/bin/
	cp doc/mars2mseed.1 ${pkgdir}/usr/share/man/man1/
}
# vim:set ts=4 sw=4:
