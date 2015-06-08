# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=stirfs
pkgver=1.5
pkgrel=1
pkgdesc='Secure, transparent and irresistible filesystem'
url='http://fenua.org/gaetan/src/'
license=('ISC')
depends=('fuse' 'openssl')
arch=('i686' 'x86_64' 'armv7h')
source=("${url}/${pkgname}-${pkgver}.c")
sha1sums=('e832af2179f9224b5572c0b92767733d10f60a2b')

build() {
	cd "${srcdir}"
	cc -lfuse -lcrypto \
		${CFLAGS} ${LDFLAGS} \
		-o ${pkgname} ${pkgname}-${pkgver}.c
}

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	head -n 15 "${pkgname}-${pkgver}.c" > "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
