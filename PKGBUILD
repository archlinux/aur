# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=webgal-terre-bin
_appname=WebGAL_Terre
pkgver=4.4.8
pkgrel=2
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
options=('!strip')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/${pkgver}/${_appname}_Linux_Arm64_${pkgver}.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/${pkgver}/${_appname}_Linux_${pkgver}.zip")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/MakinoharaShoko/WebGAL_Terre/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5'
            '44e15f9f1d9a180e4788d0dec55394dd45e59a137d627d163304c1a13aa80ac0')
sha256sums_aarch64=('f85f52bb6c922162ba356a4b6fc1146ba448c4a9a030fd1ce03e2cea24d38771')
sha256sums_x86_64=('dc1018b5b7079dd746b10d4a7e6ca806d6a9cb920d30b72e89c676f400f844c0')
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