# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Pansther
_pkgname=note-tui
pkgname=${_pkgname}-bin
pkgdesc="A Vim-friendly terminal user interface (TUI) application for managing notes"

pkgver=0.1.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux-x64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/readme.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
sha256sums=('e76356590b01f9a1d83a1cbe898e16c5725b9d45517405a2ce74a561782052e5'
            '81b43822f51cef51a8dbdf14371d0290fd8082050ab14a75157246c0ab8d90ea')
sha256sums_x86_64=('ea780399cb5d41c506040ea40a09e060545dd9e41c697a10b7bd87b8772938da')

case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${_CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
