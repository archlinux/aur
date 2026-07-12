# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bgreenwell
_pkgname=lstr
pkgname=${_pkgname}-bin
pkgver=0.3.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A fast, minimalist directory tree viewer"

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.xz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.xz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.xz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.xz")
sha256sums_x86_64=('c4dcd4d43ee2af773ab2d52d96e99b1ee5a4ca6ce403dc14d1c8c8adf09f6ae6')
sha256sums_aarch64=('c047c5cf09a99d88bbb550749e71096dbb35f244b2c8a83cc4aa5c157376c27c')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_pkgname}-${_CARCH}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
