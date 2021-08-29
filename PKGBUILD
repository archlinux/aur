# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=mseed2sac
pkgver=2.3
pkgrel=1
pkgdesc="Convert miniSEED seismic time series to SAC."
arch=("x86_64")
url="https://github.com/iris-edu/mseed2sac"
license=('GPL3')
depends=('libmseed' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f162fd423fb09e3595d43534480b56c109518a9581e09995bb22cdbeef7fa703')

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
	cp mseed2sac ${pkgdir}/usr/bin/
	cp doc/mseed2sac.1 ${pkgdir}/usr/share/man/man1/
}
# vim:set ts=4 sw=4:
