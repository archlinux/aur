# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=takakix2
_gitname=cozy
_appname=${_gitname}
_aliasname=czv
pkgname=${_appname}-bin
pkgdesc="A Comfort First terminal text editor — type like nano, navigate like vim"

pkgver=0.2.37
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0' 'MIT')

provides=("${_appname}" "${_aliasname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('a921572d037a6d55be821a360902231cd65b0c7ae9db3567200c4ca59aed5d97')
sha256sums_aarch64=('f43891d71c8948a43dead5ed90c0835fe0889842788d3bf606c69c43a8f7903b')


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

	install -Dm755 ${_appname} -t "${pkgdir}/usr/bin/"
	install -Dm755 ${_aliasname} -t "${pkgdir}/usr/bin/"

	install -Dm644 config.example.* -t "${pkgdir}/usr/share/doc/${pkgname}/config/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
