# Maintainer: Boris-Chengbiao Zhou <bobo1239@web.de>
# Contributor: Guillaume Duboc <guilduboc@gmail.com>

pkgname=hyx
pkgver=2021.06.09
pkgrel=1
pkgdesc='A minimalistic, but powerful console hex editor'
url='https://yx7.cc/code/'
license=('MIT')
depends=('glibc')
source=("https://yx7.cc/code/hyx/hyx-${pkgver}.tar.xz")
sha512sums=("43f990e29ce097f8e2378a4511a3097e2576fd72e16f3b5c81688702487c8715e7189cb4a368e344c5440a90a1c759d2f76e7831ab401fa814f7e5ff7e145bd8")
arch=('i686' 'x86_64')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Pass $LDFLAGS via $CFLAGS since hyx's Makefile only considers $CFLAGS
	export CFLAGS="$CFLAGS $LDFLAGS"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 'license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
