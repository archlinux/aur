# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mcandre
_pkgname=buttery
pkgname=${_pkgname}-bin
pkgver=0.0.21
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A video editor with manual motion smoothing"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('BSD-2-Clause')

provides=("${_pkgname}")
depends=('glibc' 'gcc-libs')
conflicts=("${_pkgname}"{,-git})

source=("${_pkgname}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}.tgz"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
sha256sums=('402e4a4a92e7fd384eaa5747a80d9a44b395007cf8ea4b75e06897043409f235'
            '353a57cee4c80f586368db4d9a77bd7c21c11d367f36afe7ab39d6a104621238'
            '57f53599a9a2272ea3ac34a2ca701bb512fec522b905ef5fc06671cd1636eeec')

case ${CARCH} in
        ${arch[0]})
                _CARCH="${_barch[0]}"
                ;;
        ${arch[1]})
                _CARCH="${_barch[1]}"
                ;;
        ${arch[2]})
                _CARCH="${_barch[2]}"
                ;;
esac

BIN_FOLDER="${_pkgname}-${pkgver}/linux/${_CARCH}"

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${BIN_FOLDER}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
