# Maintainer: Boris-Chengbiao Zhou <bobo1239@web.de>

pkgname=ynetd
pkgver=0.1.2
pkgrel=1
pkgdesc='A small (< 400 lines of C) server for binding programs to TCP ports'
url='https://yx7.cc/code/'
license=('MIT')
depends=('glibc')
source=("https://yx7.cc/code/ynetd/ynetd-${pkgver}.tar.xz")
sha512sums=("b60dc79685dff2fe4e606f07f011a4a91ee05e1335bb56bb81bc5ad46c0d249755aa525f7d44df21565c95557e56bada2caaf09cd89d713960a3e9216ea88eab")
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
