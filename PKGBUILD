# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=slarchive
pkgver=2.2
pkgrel=1
pkgdesc="A SeedLink client for archiving data streams."
arch=("x86_64")
url="https://ds.iris.edu/ds/nodes/dmc/software/downloads/slarchive/"
license=('GPL3')
depends=('libslink')
source=("${pkgname}-${pkgver}.tar.gz::http://www.iris.edu/pub/programs/SeedLink/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d73c5d8865f0104984b229dfc626068dadce8332f7e034598dc8988125818573')

prepare() {
    cd "${pkgname}-${pkgver}/src"
    sed -i 's|CFLAGS += -I../libslink||' Makefile
    sed -i 's|GCCFLAGS = -O2 -Wall -I../libslink||' Makefile
    sed -i 's|LDFLAGS = -L../libslink||' Makefile
}

build() {
    cd "${pkgname}-${pkgver}/src"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    install -D -t "${pkgdir}/usr/bin/" -m 755 "${pkgname}"
    install -D -t "${pkgdir}/usr/share/man/man1/" -m 644 "doc/${pkgname}.1"
}
# vim:set ts=4 sw=4 et:
