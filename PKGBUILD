# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=msi
pkgver=3.8
pkgrel=1
pkgdesc="A general purpose tool for parsing miniSEED records (miniSEED inspector)."
arch=("x86_64")
url="https://github.com/iris-edu/msi"
license=('GPL3')
depends=('libmseed')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e1018936832346868307a9934d82083e77894c0e356aab03e0a7e0146bbb6fec')

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
	install -D -m755 msi -t "${pkgdir}/usr/bin/"
	install -D -m644 doc/msi.1 -t "${pkgdir}/usr/share/man/man1/"
}
# vim:set ts=4 sw=4:
