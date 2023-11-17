# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=easy-player
_pkgname=music_player
pkgver=0.1.4
pkgrel=2
pkgdesc="简易的音乐播放器 - 附带歌词功能"
arch=('any')
url="https://github.com/CmarThaa/music_player"
license=('custom')
conflicts=("${pkgname}")
depends=(
    'electron25'
    'hicolor-icon-theme'
)
makedepends=(
    'npm'
    'nodejs>=18'
    'gendesk'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('d4cb1f21f8ece4e70610e6766b40de3feb835d45b01d11ecfd3ca295d473b19d'
            '42c1491d3c16e17b083fc4391f67f941c4e43016445dba34110cafdc6e0e744a')
build() {
    gendesk -q -f -n --categories "AudioVideo" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/out/${pkgname}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/src/assets/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/out/${pkgname}-linux-"*/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}