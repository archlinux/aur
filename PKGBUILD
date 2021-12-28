# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=libslink
pkgver=2.6
pkgrel=1
pkgdesc="A SeedLink client library written in C."
arch=("x86_64")
url="https://ds.iris.edu/ds/nodes/dmc/services/seedlink/"
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://ds.iris.edu/pub/programs/SeedLink/${pkgname}-${pkgver}.tar.gz")
sha256sums=('98e7be4bb6604ffd32b755cacc8c238128da91e3465517acdd42869de5ff15f4')

build() {
	cd "${pkgname}"
	make shared
}

package() {
	cd "${pkgname}"
	install -d ${pkgdir}/usr/{include,lib,share/{doc/${pkgname},man/man3}}
	cp libslink.h slplatform.h ${pkgdir}/usr/include/
	cp -a libslink.so* ${pkgdir}/usr/lib/
	cp -r example ${pkgdir}/usr/share/doc/${pkgname}/
	cp doc/UsersGuide-libslink ${pkgdir}/usr/share/doc/${pkgname}/
	cp -a doc/*.3 ${pkgdir}/usr/share/man/man3/
	
	sed -i 's/#include "slplatform.h"/#include <slplatform.h>/' \
	  ${pkgdir}/usr/include/libslink.h
}
# vim:set ts=4 sw=4:
