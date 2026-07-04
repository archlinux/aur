# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bartolli
_pkgname=codanna
pkgname=${_pkgname}-bin
pkgver=0.9.23
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="X-ray vision for your agent - Code assistant with understanding of functions, relationships, and implementations"
arch=('x86_64')
_barch=('x64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

depends=('gcc-libs' 'glibc' 'zlib')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-linux-${_barch[0]}.tar.xz")
sha256sums=('36efce3d13da2d9e28415f958d219dbd573e820bdf2ec63a9446207001c912eb')
sha256sums_x86_64=('b70378397e4e2593b0cf506ce02201fc723a827968b03280970538ad8200cf34')

case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
esac

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}-linux-${_CARCH}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "../README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
