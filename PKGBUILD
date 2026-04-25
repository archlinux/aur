# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=caldempsey
_gitname=parfit
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Paragraph fit"

pkgver=0.4.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.xz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.xz")
sha256sums_x86_64=('7613f981c721563544826968054e23911b38bb291aa69673d32c7e0c58228db6')
sha256sums_aarch64=('c7cc1da47358e455505c5937f6363263ae560126ca728d1c96d2114eb71d3d48')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_appname}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "RELEASES" "${pkgdir}/usr/share/doc/${pkgname}/RELEASES.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
