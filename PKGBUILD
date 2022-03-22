# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=squaw
pkgver=4.3
pkgrel=1
pkgdesc='Simplistic quiet user agent for the Web'
url='http://fenua.org/gaetan/src/'
arch=('i686' 'x86_64')
license=('ISC')
depends=('webkit2gtk-5.0')
source=("${url}/${pkgname}-${pkgver}.c")
sha256sums=('293e95a04d6cb81dc16a5d5c506d9f4e07000ede404fa2bb856a802f32047f80')

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
