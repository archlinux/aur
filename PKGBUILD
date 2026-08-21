# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sorairolake
_pkgname=pagen
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Generate pixel art from random numbers"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.tar.zst::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.zst")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}.tar.zst::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.zst")
sha256sums_x86_64=('b2204814b5f6bc134657c9e13120af00b1d8c841d8dc02e7b964f823bed1f15f')
sha256sums_aarch64=('b89f8282f594a344c36ab353c573f7da51fc27d9bdf9bfdfd90a9e060e86d609')


package() {
	cd "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-musl" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	for license in "./LICENSES/"* ; do
		install -Dm644 "${license}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-$(basename ${license//\.txt/})"
	done
}
