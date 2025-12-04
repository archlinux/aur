# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mcandre
_pkgname=tug
pkgname=${_pkgname}-bin
pkgver=0.0.19
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Multi-platform Docker rescue ship"
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
sha256sums=('56fdf9d7e584432d0a2f7a63222379e56a84739eb81b6f0e4fc5e9e004ade408'
            '451c83e154a1ea9a799853b50af0f83e73276dfdf1d052372b7aad613b05a25e'
            '319362074fd4edb39f6d61509c06d94b24ed06639657094dfa19b9135f19d882')

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
