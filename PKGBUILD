# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=chaqchase
_pkgname=lla

pkgname=${_pkgname}-bin
pkgver=0.5.8
pkgrel=1
pkgdesc="Blazing fast 'ls' replacement with superpowers"

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

arch=('x86_64' 'i686' 'aarch64')
license=('MIT')

makedepends=('zstd')
depends=('glibc' 'gcc-libs')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "PLUGINS-${pkgver}.md::${_urlraw}/plugins.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tzst::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tzst::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${pkgrel}-${arch[1]}.pkg.tar.zst")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tzst::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${pkgrel}-${arch[2]}.pkg.tar.zst")
sha256sums=('bb8ec1eff764c307323a48e32ea4124335d116f7dd11daf18ebac680edfc79a9'
            'e1eb1617177ac093ef3c891c8de2c6adf03df69d46360f58ad7266a1adbab35e')
sha256sums_x86_64=('92b6bf775e4f1a28ef287d3a306df048060a1b8e3bb25fc805d5c1b036aa37a3')
sha256sums_i686=('6d9d9de00583af714e5e6d2225bb10dafe49f04094c934fd4df181f30a95239d')
sha256sums_aarch64=('2db282ef757c64418d8fc401e80d27726e987f8454028e94f43d0cbb3c3536aa')

noextract=("${source_x86_64[@]%%::*}" "${source_i686[@]%%::*}" "${source_aarch64[@]%%::*}")

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar --exclude=".*" -xf "${srcdir}/${_pkgname}-${CARCH}-${pkgver}.tzst"

    mv "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}"

    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/PLUGINS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PLUGINS.md"
}
