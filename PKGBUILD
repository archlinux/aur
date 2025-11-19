# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mcandre
_pkgname=slick
pkgname=${_pkgname}-bin
pkgver=0.0.18
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A CI-ready shell language syntax checker"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('BSD-2-Clause')

conflicts=("${_pkgname}"{,-git})
provides=("${_pkgexecs[@]}")

source=("${_pkgname}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}.tgz"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
sha256sums=('b7d5c2116788f277249a3edafe51d769cd1e344c5a922a1ae3a5d55b9ebc6647'
            'bbfd5987134a3df4dbf6c63d0184154a9c8c861f88abc98594e60587f4525d2a'
            '209f2bba163b033a6911ed879497d720a64095962f5b38dac2c476674d328269')

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
