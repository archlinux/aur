# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=sac2mseed
pkgver=1.12
pkgrel=1
pkgdesc="Convert SAC seismic time series to miniSEED."
arch=("x86_64")
url="https://github.com/iris-edu/sac2mseed"
license=('GPL3')
depends=('libmseed')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('522fa95dc647e1e07ee72aa04f23c8ed4f0dcdd09067a11c4cf4bbae1587caee')

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
	cp sac2mseed ${pkgdir}/usr/bin/
	cp doc/sac2mseed.1 ${pkgdir}/usr/share/man/man1/
}
# vim:set ts=2 sw=2 et:
