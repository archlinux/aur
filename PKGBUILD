# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: orelien <aurelien.foret@wanadoo.fr>

_protname_=pppoe
_basename_=rp-${_protname_}
pkgname=${_basename_}-gui
pkgver=3.11
pkgrel=2
pkgdesc="GUI from/for Roaring Penguin's Point-to-Point Protocol over Ethernet client"
arch=("i686" "x86_64")
url="http://www.roaringpenguin.com/pppoe/"
license=("GPL")
depends=("${_basename_}=${pkgver}" "tk")
options=("!emptydirs")
source=("http://www.roaringpenguin.com/files/download/${_basename_}-${pkgver}.tar.gz")
sha1sums=('7b7b379c90b749cebd9fef99dff871e42d6972f9')

build() {
	cd "${srcdir}"/${_basename_}-${pkgver}/src
	
	./configure --prefix=/usr --enable-plugin=/ppp-2.4.4
	cd ../gui
	make
}

package() {
	cd "${srcdir}"/${_basename_}-${pkgver}/src

	cd ../gui
	make DESTDIR="${pkgdir}" install
}
