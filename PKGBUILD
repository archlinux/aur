# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=v81d
_gitname=nope
_suffix=cli
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A CLI tool for keeping track of commands you regret running."

pkgver=0.3.1
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
depends=('glibc' 'libgcc')

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_suffix}-${_barch[0]}.tar.xz")
source_aarch64=("${_appname}-${arch[0]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_suffix}-${_barch[0]}.tar.xz")
sha256sums_x86_64=('ed0aca7a397604d561f91d2815f25842b94ba600b64d483259ff90178d27bff6')
sha256sums_aarch64=('ed0aca7a397604d561f91d2815f25842b94ba600b64d483259ff90178d27bff6')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_appname}-${_suffix}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
