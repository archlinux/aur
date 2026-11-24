# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=esimov
_pkgname=pigo
pkgname=${_pkgname}-bin
pkgdesc="Fast face detection, pupil/eyes localization and facial landmark points detection"

pkgver=1.5.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('b33c6f418a5c2407c24250ea0ce13af06b9050c695bdeae81badcbbfe688a8c5')
sha256sums_x86_64=('3a114ad8fd2e09e70545503767ae73121336e25691e01c1a4720e1988724476e')

case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	_dist="${_pkgname}-${pkgver}-${_CARCH}"

	install -Dm755 "${_dist}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_dist}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
