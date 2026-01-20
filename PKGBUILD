# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=davidesantangelo
_pkgname=fastrace
pkgname=${_pkgname}
pkgver=1.0.0
pkgrel=1
pkgdesc="A fast, dependency-free traceroute implementation in pure C"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('BSD-2-Clause')

provides=("${pkgname}")
makedepends=('gcc' 'make')
depends=('glibc' 'gcc-libs')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2306b081389a98486167707733ace0e5811bd154eaf0beffd9f144e081c94ad9')

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
