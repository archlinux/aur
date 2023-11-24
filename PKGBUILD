# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=webgal-terre-bin
_appname=WebGAL_Terre
pkgver=4.4.7
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/${pkgver}/${_appname}_Linux_Arm64_${pkgver}.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/${pkgver}/${_appname}_Linux_${pkgver}.zip")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/MakinoharaShoko/WebGAL_Terre/${pkgver}/LICENSE")
sha256sums=('1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')
sha256sums_aarch64=('7d95d725e868f6ab283d4324ef933a528151e1a69abcfdf7876bc310c4b3b475')
sha256sums_x86_64=('e234e25804a9e4314af5356c74a2eff63a3f14673e1ab8a45c1c466e17ebfdac')
build() {
    gendesk -q -f -n --categories "Game;Utility" --name "${_appname//_/ }" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/release/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/assets/templates/WebGAL_Android_Template/app/src/main/ic_launcher-playstore.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"    
}