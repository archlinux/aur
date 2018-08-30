# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=mseed2ascii
pkgver=2.4
pkgrel=1
pkgdesc="Convert miniSEED seismic time series to ASCII."
arch=("x86_64")
url="https://github.com/iris-edu/mseed2ascii"
license=('GPL3')
depends=('libmseed' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('73543b42607e00ab0c5ac6f1a2b147a13c1703697cc63a7c7987b49543453abb')

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
# vim:set ts=2 sw=2 et:
