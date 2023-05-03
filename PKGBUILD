# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Dynamic, bytecode-compiled programming language and a dialect of Python'
pkgname=kuroko
pkgver=1.3.1
pkgrel=1
url=https://kuroko-lang.github.io
license=(custom:MIT)
arch=(x86_64)
depends=(glibc)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kuroko-lang/kuroko/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('2ed4e36c1d043360975608d07e3e695444319113a5ef3e975c18287eee291fd0c42981713296afc8c836b4968c03d91a3ce9f4e31b2553b98268109ebbd49a0c')

build () {
	make -C "${pkgname}-${pkgver}" prefix=/usr
}

check () {
	make -C "${pkgname}-${pkgver}" prefix=/usr test
}

package () {
	make -C "${pkgname}-${pkgver}" prefix=/usr DESTDIR="${pkgdir}" install
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
