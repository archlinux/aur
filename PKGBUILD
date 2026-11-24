# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=whyyor
_gitname=tuimessenger
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="WhatsApp, Telegram, Slack and Instagram in one terminal app"
# pkgdesc="All your networks in one terminal app: WhatsApp, Telegram, Slack and Instagram."

pkgver=0.1.6
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('AGPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('82a5d389c9452154ba386cf393f59ec7252f0d532990cc48cf273392f9753d8a')
sha256sums_aarch64=('3d46af4b06cd4af1bed5d0db9655947d2f05f512658f6fec7e703c4d0585240a')


case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
	;;

	${arch[1]})
		_CARCH=${_barch[1]}
	;;
esac

package() {
	cd "${srcdir}/${_gitname}_${_gitversion}_${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "THIRD_PARTY_NOTICES.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
}
