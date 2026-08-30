# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=chojs23
_gitname=concord
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A feature-rich TUI client for Discord"

pkgver=2.5.14
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'alsa-lib')

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.xz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.xz")
sha256sums_x86_64=('7bef23ea6e809040dc9ca366b609c757d4fac286be932fbd883b1dbb79013212')
sha256sums_aarch64=('9162d7ad571fe159756ade54c2d94ae87614f6e5339464f5ea98ea3e05c43324')


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

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
