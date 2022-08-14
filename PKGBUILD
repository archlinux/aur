# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=bim
pkgver=3.0.0
pkgrel=1
pkgdesc='Inspired by Vim, originally written for ToaruOS'
arch=(x86_64)
depends=(kuroko)
license=(custom:ISC)
url=https://github.com/klange/bim
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('de68670add196d81b73730485319a73e3f5ea7f9d7d8fcb9e45f4487443ccf44f8c6386bfeefda1a51b13207a9eea26429cc416966c8525f3e3a8d9468dde6ee')

build() {
	cd "${pkgname}-${pkgver}"
	make prefix='/usr' LDLIBS='-lkuroko' LDFLAGS="${LDFLAGS} -rdynamic"
}

package() {
	cd "${pkgname}-${pkgver}"
	make prefix='/usr' DESTDIR="${pkgdir}" install

	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
