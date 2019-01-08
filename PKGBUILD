# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=squaw
pkgver=3.2
pkgrel=1
pkgdesc='Simplistic quiet user agent for the Web'
url='http://fenua.org/gaetan/src/'
arch=('i686' 'x86_64')
license=('ISC')
depends=('webkit2gtk')
source=("${url}/${pkgname}-${pkgver}.c")
sha256sums=('1995e265d13aba21ff78b0640e56a255c15de3e84f0ca12bb0699367700eb0f3')

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
