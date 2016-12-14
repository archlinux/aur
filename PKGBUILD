# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=stirfs
pkgver=1.6
pkgrel=1
pkgdesc='Secure, transparent and irresistible filesystem'
url='http://fenua.org/gaetan/src/'
license=('ISC')
depends=('fuse3' 'openssl')
arch=('x86_64')
source=("${url}/${pkgname}-${pkgver}.c")
sha1sums=('731f3569e81c8ff5a53bbd7ca803499e009ea212')

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
