# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=chaqchase
_pkgname=lla

pkgname=${_pkgname}-bin
pkgver=0.5.7
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
sha256sums=('cb904b8fa5bed31927cc90ceb678ed1d4e760a66d7a475c03c1b1f5a9de8f6d3'
            'e1eb1617177ac093ef3c891c8de2c6adf03df69d46360f58ad7266a1adbab35e')
sha256sums_x86_64=('c73eb2515096238976df37f0d5c37caea9ef483c1c55828489fb84b75b8a2e6e')
sha256sums_i686=('47d70fb69263590e6e912611996000e9d68d23ea01885e103e4164290a31dd2d')
sha256sums_aarch64=('f245ca3c7dffece40b42508de544ff2cb87ed9bdd6ff8f697b0d7f0791ad09ad')

noextract=("${source_x86_64[@]%%::*}" "${source_i686[@]%%::*}" "${source_aarch64[@]%%::*}")

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar --exclude=".*" -xf "${srcdir}/${_pkgname}-${CARCH}-${pkgver}.tzst"

    mv "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}"

    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/PLUGINS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PLUGINS.md"
}
