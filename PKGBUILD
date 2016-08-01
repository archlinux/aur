# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=squaw
pkgver=3.0
pkgrel=1
pkgdesc='Simplistic quiet user agent for the Web'
url='http://fenua.org/gaetan/src/'
license=('ISC')
depends=('webkit2gtk')
arch=('i686' 'x86_64')
source=("${url}/${pkgname}-${pkgver}.c")
sha1sums=('1fe435c7fd8534ec18e718ace8d8ced0003580c8')

build() {
	cd "${srcdir}"
	cc $(pkg-config --cflags --libs gtk+-3.0 webkit2gtk-4.0) \
		${CPPFLAGS} ${CFLAGS} ${LDFLAGS} \
		-o ${pkgname} ${pkgname}-${pkgver}.c
}

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	head -n 15 "${pkgname}-${pkgver}.c" > "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
