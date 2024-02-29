# Maintainer: Boris-Chengbiao Zhou <bobo1239@web.de>

pkgname=ynetd
pkgver=2024.02.17
pkgrel=1
pkgdesc='A small (< 400 lines of C) server for binding programs to TCP ports'
url='https://yx7.cc/code/'
license=('MIT')
depends=('glibc')
source=("https://yx7.cc/code/ynetd/ynetd-${pkgver}.tar.xz")
sha512sums=("d71684793a1be45a681a029ee84e415e4cebda4c5c05f79fdbedca77bf14eca55f47e987b732a54617d1191b981eb88f94645fe5dabfd2c08faf9d3421baf7cd")
arch=('i686' 'x86_64')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Pass $LDFLAGS via $CFLAGS since ynetd's Makefile only considers $CFLAGS
	export CFLAGS="$CFLAGS $LDFLAGS"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 'license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
