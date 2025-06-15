# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=adrelanos
pkgname=tor-ctrl
pkgver=5.7
pkgrel=1
pkgdesc="Tor control port command line tool"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('GPL-3.0-or-later')

makedepends=('pandoc')
depends=('bash' 'safe-rm')

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/${pkgver}-${pkgrel}.tar.gz")
sha256sums=('801b72679c1ce14f90e36e53148d3345426f0071a921e8e2161422afe87286c3')

prepare() {
	cd ${srcdir}/${pkgname}-${pkgver}-${pkgrel} || exit 1

	git init
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}-${pkgrel} || exit 1

	./configure.sh man
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}-${pkgrel} || exit 1

	for bin in "./usr/bin/${pkgname}"*; do
		install -Dm755 ${bin} "${pkgdir}/${bin}"
	done

	install -Dm644 "./auto-generated-man-pages/${pkgname}.8" "${pkgdir}/usr/share/man/man8/${pkgname}.8"

	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
