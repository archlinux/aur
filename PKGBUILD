# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ringserver
pkgver=2020.075
pkgrel=1
pkgdesc="A generic packet ring buffer with network interfaces."
arch=("x86_64")
url="https://github.com/iris-edu/ringserver"
license=('Apache-2.0')
depends=('libmseed' 'mxml' 'pcre')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('06a3d9c9a5d870cb8f4e0070f0c6238a96fbad0174960c743163fac76d8ee12b')

prepare() {
	cd ${pkgname}-${pkgver}/src
	sed -i 's/^CFLAGS.*/CFLAGS += -D_REENTRANT -D_POSIX_PTHREAD_SEMANTICS/' Makefile
	sed -i 's/^LDLIBS.*/LDLIBS = -lpcre -lmseed -lmxml -lpthread/' Makefile
}

build() {
	cd ${pkgname}-${pkgver}/src
	make
}

package() {
	cd ${pkgname}-${pkgver}
	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -Dm644 doc/HowTo-SeedLink-server.txt \
		${pkgdir}/usr/share/doc/${pkgname}/HowTo-SeedLink-server.txt
	install -Dm644 doc/ring.conf ${pkgdir}/usr/share/${pkgname}/ring.conf
	install -Dm644 doc/${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=4 sw=4:
