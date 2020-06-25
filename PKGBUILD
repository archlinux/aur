# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
_pkgname=nngpp
pkgname=${_pkgname}-git
pkgver=1.3.00cc5d264
pkgrel=2
pkgdesc="C++ wrapper around the nanomsg NNG API "
arch=('x86_64')
url="https://github.com/cwzx/nngpp"
license=('MIT')
depends=('nng'
	'mbedtls')
makedepends=('catch2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
epoch=1
source=("${_pkgname}::git+https://github.com/cwzx/nngpp.git")

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | tr -d 'nng\-v' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
	cd "${_pkgname}"
	make test
}

package() {
	cd "${_pkgname}"
	install -dm755 "${pkgdir}/usr/include"
	cp -r include "${pkgdir}/usr"
	find "${pkgdir}/usr/include/${_pkgname}" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644  {} \; \)
	install -m644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m644 -D "readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

sha256sums=('SKIP')
