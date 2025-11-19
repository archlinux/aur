# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mcandre
_pkgname=factorio
pkgname=${_pkgname}-bin
pkgver=0.0.16
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Go cross-compiler"
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
sha256sums=('2e492fc6fcc5e35335eb05c7f484ca1f834f21969c2d18bf7777f012b121cf0e'
            'cb7f897be9efbc7ab7945b70ca7c55e8f3b97b85550a334c5d9a3e233ca84bc8'
            '6add2b3f8c452746c586f4462b3e969fd202382dd5c5bf3378cb9ccc6825e047')

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
