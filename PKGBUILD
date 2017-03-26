# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=squaw
pkgver=3.1
pkgrel=4
pkgdesc='Simplistic quiet user agent for the Web'
url='http://fenua.org/gaetan/src/'
arch=('i686' 'x86_64')
license=('ISC')
depends=('webkit2gtk')
source=("${url}/${pkgname}-${pkgver}.c")
sha256sums=('1a5650ef7e34345abb270353513acb3aba7efcd089d66ad69ebe95ff38c72185')

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
