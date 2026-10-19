# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=LambdaBytes
_gitname=sping
_appname=${_gitname}
pkgname=${_appname}-rs-bin
pkgdesc="A modern, cross-platform ping with real-time diagnostics, network context, quality scoring, and multi-target monitoring"

pkgver=1.7.1
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

depends=('glibc' 'libgcc')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}-${pkgrel}_${_barch[0]}.deb")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}-${pkgrel}_${_barch[1]}.deb")
sha256sums_x86_64=('c9c5f154025c324f6af99f6735c36f559903dd43be16e3ae9d0064de2d05e1d5')
sha256sums_aarch64=('d0bb5f0ee94f61298d3d89f892673b1487783c90e2abeb7fb885a6d7a809be7e')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.xz"

	mv "${pkgdir}/usr/share/doc/${_appname}" "${pkgdir}/usr/share/doc/${pkgname}"

	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	mv "${pkgdir}/usr/share/doc/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
