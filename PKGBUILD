# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=mseed2sac
pkgver=2.2
pkgrel=1
pkgdesc="Convert miniSEED seismic time series to SAC."
arch=("x86_64")
url="https://github.com/iris-edu/mseed2sac"
license=('GPL3')
depends=('libmseed' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ecf6a4d54035025c88f93c4acefa2201a9bfcafb7439016bd4a2d3b666c4b399')

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
# vim:set ts=2 sw=2 et:
