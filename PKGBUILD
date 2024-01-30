# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sqlite3-page-explorer-bin
pkgver=1.0
pkgrel=5
pkgdesc="Cross Platform app to explore internal organisation of tables and indices"
arch=('x86_64')
url="https://github.com/siara-cc/sqlite3_page_explorer"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
makedepends=('gendesk')
depends=(
    'nss'
    'alsa-lib'
    'gtk3'
    'libxss'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}-linux/${pkgname%-bin}-linux-x64.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/siara-cc/sqlite3_page_explorer/v${pkgver}-linux/res/img/siara_cc_3d.png"
)
sha256sums=('92b07fa1b44f7d07e5fb275b0dba8cf7ed84817dc7b98f5a20e52529d1ee1f9a'
            '7ef8dd87b2d77fe2c4acbb9c2573b29b2ced763614f46ff6176e399130bb12dd')
build() {
    gendesk -q -f -n --categories "Development" --name "${pkgname%-bin}" --exec "${pkgname%-bin} --no-sandbox %U"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}-linux-x64/"*  "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}