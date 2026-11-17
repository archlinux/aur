# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=LambdaBytes
_gitname=sping
_appname=${_gitname}
pkgname=${_appname}-rs-bin
pkgdesc="A modern, cross-platform ping with real-time diagnostics, network context, quality scoring, and multi-target monitoring"

pkgver=1.9.0
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
sha256sums_x86_64=('cdc8f276f7b5ed83b5781beba592e95c275cfd2bb0d921f3721c90a0bf2d62f6')
sha256sums_aarch64=('cfbd20fb22eb3561f3cd5928d6812a5673e65a5ae8a277de8aa19965550b75b3')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.xz"

	mv "${pkgdir}/usr/share/doc/${_appname}" "${pkgdir}/usr/share/doc/${pkgname}"

	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	mv "${pkgdir}/usr/share/doc/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
