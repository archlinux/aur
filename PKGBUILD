# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=stirfs
pkgver=2.0
pkgrel=1
pkgdesc='Secure, transparent and irresistible filesystem'
url='https://fenua.org/gaetan/src/'
license=('ISC')
depends=('fuse3' 'openssl')
arch=('x86_64')
source=("${url}/${pkgname}-${pkgver}.c")
sha256sums=('46676619f71572e77ec492a3f9fc9de69ffc0f93be22ec4fbdc416fe56598d22')

build() {
	cd "${srcdir}"
	cc \
		-I/usr/include/fuse3 -lfuse3 -lcrypto \
		${CFLAGS} ${LDFLAGS} \
		-o ${pkgname} ${pkgname}-${pkgver}.c
}

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	head -n 15 "${pkgname}-${pkgver}.c" > "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
