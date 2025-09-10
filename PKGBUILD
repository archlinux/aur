# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=keircn
_pkgname=gtl
pkgname=${_pkgname}-bin
pkgver=0.2.0
_pkgvername=${pkgver}
pkgrel=1
pkgdesc="Transforms text into properly capitalized titles according to the Chicago Manual of Style"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${_barch[1]}.tar.gz")
sha256sums_x86_64=('e7d208bd2d1819955a4f57fddb7cdb0079717371ef8cbdb0b75d8d40307121d7')
sha256sums_aarch64=('603406d7a08d530e2b025f8297b1986cf981db5f9631867f940e07e2c4ffa397')

case "${CARCH}" in
  ${arch[0]})
	_CARCH="${_barch[0]}" ;;
  ${arch[1]})
	_CARCH="${_barch[1]}" ;;
  *)
	printf 'Architecture %s is not supported\n' "$CARCH" >&2
	exit 1 ;;
esac

package() {
	cd "${srcdir}/${_pkgname}-${_pkgvername}-linux-${_CARCH}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
