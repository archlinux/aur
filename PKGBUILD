# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=esimov
_pkgname=caire
pkgname=${_pkgname}-bin
pkgdesc="Content aware image resize library based on Seam Carving"

pkgver=1.5.0
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
sha256sums_x86_64=('b723221defae71ca7fe44c9007a0583568a0e1ac4436e696cc0b80c7be697fa4')

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
