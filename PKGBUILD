# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=squaw
pkgver=4.0
pkgrel=1
pkgdesc='Simplistic quiet user agent for the Web'
url='http://fenua.org/gaetan/src/'
arch=('i686' 'x86_64')
license=('ISC')
depends=('webkit2gtk-5.0')
source=("${url}/${pkgname}-${pkgver}.c")
sha256sums=('e7dcae37d7d23e4b0275a4c4d2668d682636a1782163c41d174dbee8386334f3')

build() {
	cd "${srcdir}"
	cc $(pkg-config --cflags --libs gtk4 webkit2gtk-5.0) \
		${CPPFLAGS} ${CFLAGS} ${LDFLAGS} \
		-o ${pkgname} ${pkgname}-${pkgver}.c
}

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	head -n 15 "${pkgname}-${pkgver}.c" > "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
