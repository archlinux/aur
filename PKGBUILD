# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=craigderington
_pkgname=prox
pkgname=${_pkgname}
pkgdesc="A modern process manager with a beautiful Terminal User Interface (TUI)"

pkgver=0.2.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

makedepends=('go')
depends=('glibc')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/${_pkgvername}.tar.gz")
sha256sums=('b7105d128e2a2360ada71182c5fad0d0b91e9bab04522db8a5c9158586990dd9')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	go build -o ${pkgname} .
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
