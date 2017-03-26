# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=stirfs
pkgver=1.7
pkgrel=2
pkgdesc='Secure, transparent and irresistible filesystem'
url='http://fenua.org/gaetan/src/'
license=('ISC')
depends=('fuse3' 'openssl')
arch=('x86_64')
source=("${url}/${pkgname}-${pkgver}.c")
sha256sums=('83419d236aea6189ff70c96a2d617c4d983cb5a75e62f9949c0162e056040d14')

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
