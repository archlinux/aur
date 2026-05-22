# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Pansther
_pkgname=minesweeper-tui
pkgname=${_pkgname}-bin
pkgdesc="A Vim-friendly Minesweeper TUI"

pkgver=0.3.0
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

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
sha256sums=('a9833f78f84c1d439538adfdf77b1ebb3541aba4ccb718d6fdad8b9143e8ac64'
            'a3b7cf18b60c68ef0d950e337250a23a0dd6eeed0a3fd7649dc1b8ec17f3f518')
sha256sums_x86_64=('5eb75032323ddcbb6255c283ba01c2e1468ec815e5590331e3439e52bf91c422')

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
