# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ztroop
_pkgname=btlescan
pkgname=${_pkgname}-bin
pkgdesc="BTLE/Bluetooth Scanner"

pkgver=1.1.2
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'dbus')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.tar.gz")
sha256sums=('9adb256349970884a5e847d5d2987921146a01d92e23ad54a16b4a5bcdea80ee'
            '37fdad1e971ac1b5024c1f36c6a420e5ec6afe37266186fb3cf8ce081a494a76')
sha256sums_x86_64=('4052d0a3053be02942c06c0c271464fd2c7a7cab4ec0203b03410fe354e6b02c')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
	${arch[1]})
		_CARCH="${_barch[1]}"
		;;
esac


package() {
	cd "${srcdir}/${_pkgname}-${_pkgvername}-${_CARCH}" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "../README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

