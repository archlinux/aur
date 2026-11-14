# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=esimov
_pkgname=caire
pkgname=${_pkgname}-bin
pkgdesc="Content aware image resize library based on Seam Carving"

pkgver=1.6.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libxcursor' 'libxfixes' 'libxkbcommon' 'wayland' 'libxkbcommon-x11' 'libx11' 'libxcb' 'libglvnd')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('b33c6f418a5c2407c24250ea0ce13af06b9050c695bdeae81badcbbfe688a8c5')
sha256sums_x86_64=('ed0eb0107e17d01428c970bbb6842f74c6d268b31b8e2d9fa23b153073850ba8')

case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}-${_CARCH}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}-${pkgver}-${_CARCH}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
