# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=davidesantangelo
_pkgname=fastrace
pkgname=${_pkgname}
pkgver=0.3.1
pkgrel=1
pkgdesc="A fast, dependency-free traceroute implementation in pure C"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('BSD-2-Clause')

provides=("${pkgname}")
makedepends=('gcc' 'make')
depends=('glibc' 'gcc-libs')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b8c79571191266f0f3ef58033b24bb27c81182bfd4f99cd868e778e6876b08bd')

build() {
	cd ${pkgname}-${pkgver} || exit 1

	make optimized
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	make PREFIX="${pkgdir}/usr" install

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
