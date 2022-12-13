# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=libslink
pkgver=2.6
pkgrel=2
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
	install -Dt ${pkgdir}/usr/include/ -m644 libslink.h slplatform.h
	install -Dt ${pkgdir}/usr/lib/ libslink.so.${pkgver}
	ln -s libslink.so.${pkgver} ${pkgdir}/usr/lib/libslink.so.${pkgver%%.*}
	ln -s libslink.so.${pkgver} ${pkgdir}/usr/lib/libslink.so
	install -Dt ${pkgdir}/usr/share/doc/${pkgname}/ -m644 doc/UsersGuide-libslink
	install -Dt ${pkgdir}/usr/share/man/man3/ -m644 doc/*.3
	cp -r example ${pkgdir}/usr/share/doc/${pkgname}/
}
# vim:set ts=4 sw=4 et:
