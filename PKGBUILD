# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Gu1llaum-3
_pkgname=sshm
pkgname=${_pkgname}-bin
pkgver=1.10.0
pkgrel=2
_pkgvername=v${pkgver}
pkgdesc="A modern, interactive SSH Manager for your terminal"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_linux_${_barch[1]}.tar.gz")
sha256sums_x86_64=('86df71fa2618f8103c0e10206190e792ffc1954e371aaebb5a7870dab45bc5c9')
sha256sums_aarch64=('a5e0559e344b8b99c3b57805c323e35e8df15c3b71f8aa03d4d65cb6956167ef')

case "${CARCH}" in
	${arch[0]})
		_CARCH="${_barch[0]}" ;;
	${arch[1]})
		_CARCH="${_barch[1]}" ;;
	*)
		_CARCH="${CARCH}" ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
