# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=chaqchase
_pkgname=lla

pkgname=${_pkgname}-bin
pkgver=0.6.3
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
        "PLUGINS-${pkgver}.md::${_urlraw}/docs/plugins/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tzst::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tzst::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${pkgrel}-${arch[1]}.pkg.tar.zst")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tzst::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${pkgrel}-${arch[2]}.pkg.tar.zst")
sha256sums=('2079dc8b031b0272fbfe6b919daf7dcf9f4cda65c5a9821028546ae0cef53d0b'
            'dedfeaf7efda07832c83d938d66c7868b4c7d45e17d2b6250e523780a5f79acf')
sha256sums_x86_64=('ffd7f0ede0ba2e411baf4ba06330e22c7e1590a10e1f7826b324ddcdc43597f3')
sha256sums_i686=('24611fc1158fddd068073e36143c47cc2ae088cd29617ab7973be5e272f1a914')
sha256sums_aarch64=('4b64357395088f3adb9f0e5e9a4d5a3c338b5456d0676a43636b67bdbe4db694')

noextract=("${source_x86_64[@]%%::*}" "${source_i686[@]%%::*}" "${source_aarch64[@]%%::*}")

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar --exclude=".*" -xf "${srcdir}/${_pkgname}-${CARCH}-${pkgver}.tzst"

    mv "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}"

    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/PLUGINS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PLUGINS.md"
}
