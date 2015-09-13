# Maintainer: Daniel <dgcbueu@gmail.com>

pkgname=zjtag
pkgver=1.8
pkgrel=1
pkgdesc="zJTAG is an utility for debricking routers, it supports several USB and parallel JTAG cables"
arch=('i686' 'x86_64')
url="http://zjtag.sourceforge.net/"
license=('GPL2')
depends=('libftd2xx')
#depends=('libftd2xx' 'ncurses')
makedepends=('gcc' 'libftd2xx' 'libusb')
source=("http://sourceforge.net/projects/${pkgname}/files/v${pkgver}/${pkgname}-${pkgver}.zip")
md5sums=('acc87cd424081f1be7df794ee42eb109')

build() {
	cd ${srcdir}/${pkgname}.source_${pkgver}/src
	sed -i -e "s:usr/local:usr:" Makefile
	make zjtag || return 1
}

package() {
	cd ${srcdir}/${pkgname}.source_${pkgver}/src
	install -D -m 755 zjtag ${pkgdir}/usr/bin/zjtag
}
