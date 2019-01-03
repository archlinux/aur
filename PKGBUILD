# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=usocks
pkgver=0.7
pkgrel=1
pkgdesc='Minimalistic SOCKS5 proxying library'
url='http://fenua.org/gaetan/src/'
license=('ISC')
arch=('i686' 'x86_64' 'armv7h')
optdepends=('openssh: companion script')
source=("${url}/${pkgname}-${pkgver}.c"
        "${pkgname}")
sha256sums=('193d9ea364baa1876da3e911b240f185ecd24d20868537e9a96020ef8fe6f0e8'
            'd37a1996aafc0a5dfdf98a8ff0251f93c4c6e8e1b6b2db840289c9935e0a34a4')

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
