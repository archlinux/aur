# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=usocks
pkgver=0.6
pkgrel=2
pkgdesc='Minimalistic SOCKS5 proxying library'
url='http://fenua.org/gaetan/src/'
license=('ISC')
arch=('i686' 'x86_64' 'armv7h')
optdepends=('openssh: companion script')
source=("${url}/${pkgname}-${pkgver}.c"
        "${pkgname}")
sha1sums=('2f2b1705f9f622ca3542805e2d693ff8e786d189'
          '799137e8ae0b67d947bbdaa9e13e25f5c9d3af8c')

build() {
	cd "${srcdir}"
	cc -fPIC -ldl -shared \
		${CFLAGS} ${LDFLAGS} \
		-o ${pkgname}.so ${pkgname}-${pkgver}.c
}

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${pkgname}.so" "${pkgdir}/usr/lib/${pkgname}.so"
	head -n 15 "${pkgname}-${pkgver}.c" > "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
