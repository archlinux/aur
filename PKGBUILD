# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=LambdaBytes
_gitname=sping
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern, cross-platform ping with real-time diagnostics, network context, quality scoring, and multi-target monitoring"

pkgver=1.5.4
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
sha256sums=('af3bf88b64fb242d12fbc697f8e8313c97657b3461bff3ed7e7b99ed1d436727')
sha256sums_x86_64=('f2755e1d010ddaf61bcf56b825e40601b094bfeda73769a647780aa1fd80353b')
sha256sums_aarch64=('6659c5c7b423f61170d678eb413490fe45d97b9c72553603fa821925adf9c9ed')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.xz"

	mv "${pkgdir}/usr/share/doc/${_appname}" "${pkgdir}/usr/share/doc/${pkgname}"

	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	mv "${pkgdir}/usr/share/doc/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
