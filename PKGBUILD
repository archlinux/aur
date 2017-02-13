# Maintainer: Vincent Pasquier <vincentpasquier@posteo.net>
_vendor=adafruit
_pkgname=rpi-rgb-led-matrix
pkgname="${_vendor}-${_pkgname}-git"
pkgver=1
pkgrel=2
pkgdesc="rgbmatrix library to take advantage of Adafruit RPi Led Matrix HAT"
arch=("armv7h" "armv6h" "aarch64")
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
	cd "${srcdir}/${_pkgname}"

	mkdir -p "${pkgdir}/usr/lib/python2.7/site-packages/"
	mkdir -p "${pkgdir}/usr/include"
	mkdir -p "${pkgdir}/usr/share/fonts/misc"

	install -D -m644 "lib/librgbmatrix.a" "${pkgdir}/usr/lib/librgbmatrix.a"
	install -D -m644 include/*.h "${pkgdir}/usr/include/"
	install -D -m755 "rgbmatrix.so" "${pkgdir}/usr/lib/python2.7/site-packages/rgbmatrix.so"
	install -D -m644 fonts/*.bdf "${pkgdir}/usr/share/fonts/misc/"
}
