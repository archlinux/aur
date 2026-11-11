# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=aabolfazl
_gitname=adbtop
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Live performance for Android apps, in your terminal and your CI"

pkgver=0.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('android-tools')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('5cc49ddc781aaddd4c7eaa4a478b358362d299eb1515d1dfdfee8eb4653aa575')
sha256sums_aarch64=('55ad4c22bebcc08f006cd1406786565d3a3187adc961efa8b52120728baea565')


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
