# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mcandre
_pkgname=stank
_pkgexecs=(stank stink funk)
pkgname=${_pkgname}-bin
pkgver=0.0.39
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Analyzers for determining whether files smell like rotten POSIX shell scripts, or faintly rosy like Ruby and Python scripts"
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
sha256sums=('a82020b5691df009428e585a4f6d5c4a3a282a40080416db610f4bd607b0da6c'
            '64921940db9b2f5887a3eee8e6702ab1d277599ae1488e184702f3745ce7d59f'
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

	for bin in ${_pkgexecs[@]}; do
        install -Dm755 "${BIN_FOLDER}/${bin}" "${pkgdir}/usr/bin/${bin}"
	done

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
