# Maintainer: Vincent Pasquier <vincentpasquier@posteo.net>
_vendor=adafruit
_pkgname=rpi-rgb-led-matrix
pkgname="${_vendor}-${_pkgname}-git"
pkgver=1
pkgrel=1
pkgdesc="rgbmatrix library to take advantage of Adafruit RPi Led Matrix HAT"
arch=("armv7h")
url="https://www.adafruit.com/"
license=('GPL')
optdepends=("python2")
source=("git+https://github.com/${_vendor}/${_pkgname}.git")
md5sums=('SKIP')

prepare() {
	cd "${srcdir}/${_pkgname}"
	find -iname Makefile -exec sed -i "s/^\(CXXFLAGS=.*\)$/\1 -fPIC/g" {}  \;
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {

	mkdir -p "${pkgdir}/usr/lib/python2.7/site-packages/"
	mkdir -p "${pkgdir}/usr/include"

	install -D -m644 "${srcdir}/${_pkgname}/lib/librgbmatrix.a" \
		"${pkgdir}/usr/lib/librgbmatrix.a"

	install -D -m644 ${srcdir}/${_pkgname}/include/*.h "${pkgdir}/usr/include/"

	install -D -m755 "${srcdir}/${_pkgname}/rgbmatrix.so" \
		"${pkgdir}/usr/lib/python2.7/site-packages/rgbmatrix.so"
}
