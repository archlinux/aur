# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=leohenon
_gitname=opengh
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal app for GitHub that feels like opening a repo in your browser"

pkgver=0.0.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('7ba1fd3b92d193dbc17bf373e5bd649bd9b43dda7dcdfb210f1d3080d914e11a')
sha256sums_x86_64=('ba8b00711501deadb5544d6d34622f5e8c091ee63421acc1c68a94598f598d41')
sha256sums_aarch64=('3fd3e15cd6e4f71a004645deb8a467f5bc667d7176136f6bfcf93e3d52766585')


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

	install -Dm644 "../README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "THIRD-PARTY-NOTICES.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
