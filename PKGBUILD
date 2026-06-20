# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=max-rh
_gitname=sshelf
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Fast terminal UI for managing and connecting to SSH hosts"

pkgver=0.6.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT' 'Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.xz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.xz")
sha256sums_x86_64=('472910fe402258283f4f265f1bb2eab6c01178ab94db42c2013ea4a200e7b889')
sha256sums_aarch64=('c45677e69bd5e1b325646cc89b33ece179f8a651d0ef9228550024d3499d0f49')


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

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
