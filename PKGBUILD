# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=yuuki
_pkgname=lstf
pkgname=${_pkgname}-bin
pkgdesc="The aggregated TCP flows printer in Linux"

pkgver=0.7.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686')
_barch=('linux_amd64' 'linux_386')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('d314fa91d7b39ea6871f18dea8bc214d4e5874286040a315b5ebaafec6c9f4c0')
sha256sums_i686=('24471752a26c8ffc39ba214b0776e921f23e3ede5ee1aa5bd3ad45e0dd235bb6')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
	${arch[1]})
		_CARCH="${_barch[1]}"
		;;
esac

package() {
	cd "${srcdir}/${_pkgname}_${_pkgvername}_${_CARCH}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
