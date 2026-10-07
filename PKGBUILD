# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=LambdaBytes
_gitname=sping
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern, cross-platform ping with real-time diagnostics, network context, quality scoring, and multi-target monitoring"

pkgver=1.5.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}-${pkgrel}_${_barch[0]}.deb")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}-${pkgrel}_${_barch[1]}.deb")
sha256sums_x86_64=('d120fac9a2a271b40519af4571f7d2907d0478ffc32cef050b3520541d88be31')
sha256sums_aarch64=('7d59bb321e87522735cbc7e248b548c78a53c10e8eaf533f581632af6ccebdbf')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.xz"

	mv "${pkgdir}/usr/share/doc/${_appname}" "${pkgdir}/usr/share/doc/${pkgname}"

	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	mv "${pkgdir}/usr/share/doc/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
