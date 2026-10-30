# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=pauloremoli
_pkgname=logana
pkgname=${_pkgname}-bin
pkgdesc="A TUI log analyzer built for speed - handles files with millions of lines with instant filtering and navigation"

pkgver=0.8.4
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.xz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.xz")
sha256sums_x86_64=('263f52528f4729861529e357082e013f892452577013325c4ababf4871589130')
sha256sums_aarch64=('45a000da7de036b089840a9da330fa588a40c6acfb0c0bf8605a38c1f88e234f')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
	${arch[1]})
		_CARCH="${_barch[1]}"
		;;
esac

package() {
	cd "${srcdir}/${_pkgname}-${_CARCH}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
