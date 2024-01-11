# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=webgal-terre-bin
_appname=WebGAL_Terre
pkgver=4.4.9
pkgrel=1
pkgdesc="Galgame Editing. Redefined | 视觉小说编辑，再进化"
arch=(
    "aarch64"
    "x86_64"
)
url="https://docs.openwebgal.com/guide/"
_ghurl="https://github.com/MakinoharaShoko/WebGAL_Terre"
license=('MPL2')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'cairo'
    'mesa'
    'libxrandr'
    'libxcomposite'
    'libdrm'
    'libxdamage'
    'nspr'
    'at-spi2-core'
    'nss'
    'libcups'
    'libxext'
    'libxkbcommon'
    'libx11'
    'pango'
    'java-runtime'
    'alsa-lib'
    'expat'
    'libxcb'
    'libxfixes'
    'gtk3'
)
makedepends=(
    'gendesk'
)
options=(
    '!strip'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/${pkgver}/${_appname}_Linux_Arm64_${pkgver}.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/${pkgver}/${_appname}_Linux_${pkgver}.zip")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/MakinoharaShoko/WebGAL_Terre/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5'
            '329b059310e0f79fda5049929e09451f8f3de987219e601c0226046cc9159ab3')
sha256sums_aarch64=('d8eb7274c813708bd171f10c8a71e33acead7c1ed0782773d48c059e055cd852')
sha256sums_x86_64=('47a2b9da29ce23f7adb7d4284e2807cf02c9927029015999cbed133902df8720')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_appname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Game;Utility" --name "${_appname//_/ }" --exec "${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/release/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/assets/templates/WebGAL_Android_Template/app/src/main/ic_launcher-playstore.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"    
}