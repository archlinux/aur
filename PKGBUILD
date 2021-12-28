# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=mseedindex
pkgver=2.7.1
pkgrel=1
pkgdesc="A Simple program for synchronizing a miniSEED file with a database."
arch=("x86_64")
url="https://github.com/iris-edu/mseedindex"
license=('GPL3')
depends=('libmseed' 'postgresql-libs' 'sqlite')
optdepends=('postgresql: for using PostgreSQL database')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('223bc89a6eff75fed86f0b730504a35a2d96241db72eb5c558aa5b251a799da9')

prepare() {
	cd "${pkgname}-${pkgver}/src"
	sed -i 's|EXTRACFLAGS = -I../libmseed -I../sqlite||' Makefile
	sed -i 's|EXTRA -I../sqlite||' Makefile
	sed -i 's|EXTRALDFLAGS = -L../libmseed -I../sqlite||' Makefile
	sed -i 's|../sqlite/sqlite3.c||' Makefile
	sed -i 's|LDLIBS = -lmseed -lpq|LDLIBS = -lmseed -lpq -lsqlite3|' Makefile
}

build() {
	cd "${pkgname}-${pkgver}/src"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -D -t "${pkgdir}/usr/bin/" -m 755 mseedindex
	install -D -t "${pkgdir}/usr/share/man/man1/" -m 644 doc/mseedindex.1
}
# vim:set ts=4 sw=4:
