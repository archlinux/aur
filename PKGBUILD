# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=blink1
pkgver=1.95
pkgrel=2
pkgdesc='software for blink(1) USB RGB LED'
arch=('i686' 'x86_64')
url='https://github.com/todbot/blink1'
license=('GPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/todbot/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ea3a1d366b290d70ea21624b4c920f768872679f18fff8d2987c9e9d8b7e432a')

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

