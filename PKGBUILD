# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=ezxml
pkgver=0.8.6
pkgrel=2
pkgdesc="A C library for parsing XML documents inspired by simpleXML for PHP."
arch=("x86_64")
url="http://ezxml.sourceforge.net/"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/${pkgname}/files/ezXML/ezXML%20${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a68d52257dcb0ff2ad3d71c8c64311edb8030254bb8b581e229aeaba6231cdf9')

build() {
	cd "${pkgname}"
	gcc -Wall -O2 -fpic -c -o ezxml.o ezxml.c 
	gcc -shared -o libezxml.so.${pkgver} ezxml.o
}

package() {
	cd "${pkgname}"
	install -Dt ${pkgdir}/usr/include/ -m644 ezxml.h
	install -Dt ${pkgdir}/usr/lib/ -m755 libezxml.so.${pkgver}
	ln -s libezxml.so.${pkgver} ${pkgdir}/usr/lib/libezxml.so.${pkgver%%.*}
	ln -s libezxml.so.${pkgver} ${pkgdir}/usr/lib/libezxml.so
	install -Dt ${pkgdir}/usr/share/licenses/${pkgname}/ -m644 license.txt
}
# vim:set ts=4 sw=4 et:
