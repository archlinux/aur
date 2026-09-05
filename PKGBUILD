# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=reekta92
_gitname=sicth
_appname=${_gitname}
pkgname=${_gitname}-bin
pkgdesc="A minimal TUI file navigator"

pkgver=1.1.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%%-bin}")

depends=('glibc' 'libgcc')

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}.tar.xz")
sha256sums_x86_64=('2e73af2a00576697fc930878ee543ba58fadfa1a33ca6c702be75a9f1fefc079')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
