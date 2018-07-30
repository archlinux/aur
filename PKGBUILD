# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=mseed2ascii
pkgver=2.3
pkgrel=1
pkgdesc="Convert miniSEED seismic time series to ASCII."
arch=("x86_64")
url="https://github.com/iris-edu/mseed2ascii"
license=('GPL3')
depends=('libmseed' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('febd251235ba0f50185484205d40e3b0cf78460906f6f958aba0245701a621f6')

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
