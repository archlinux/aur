# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=blink1
pkgver=1.98
pkgrel=1
pkgdesc='software for blink(1) USB RGB LED'
arch=('i686' 'x86_64')
url='https://github.com/todbot/blink1'
license=('GPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/todbot/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('56cba26c4d22b515f22104eb0bb7ef47accdac50ed43d775ccb81b2294a2ad13')

prepare() {
	cd ${srcdir}/${pkgname}-${pkgver}/commandline/

	sed -i 's/-static//g' Makefile

	cd ${srcdir}/${pkgname}-${pkgver}/linux/

	sed -i 's/, GROUP="plugdev"//' 51-blink1.rules
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/commandline/

	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/commandline/

	# binary
	install -D -m0755 blink1-tool ${pkgdir}/usr/bin/blink1-tool

	cd ${srcdir}/${pkgname}-${pkgver}/linux/

	# udev rule
	install -D -m0644 51-blink1.rules ${pkgdir}/usr/lib/udev/rules.d/51-blink1.rules
}

