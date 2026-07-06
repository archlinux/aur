# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=MkP369
_gitname=idu
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Instant du -sh and a bit more"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64-v3' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('54ab3cac9cdba587d9d3acb7330161a555dcc8fdc317d32801c53419735151ca')
sha256sums_aarch64=('65822edd74992d2f76fee48f1f21829a0b12e010863e6e310bed64d8caee303a')


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
