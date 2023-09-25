# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=webgal-terre-bin
_appname=WebGAL_Terre
pkgver=4.4.5
pkgrel=1
pkgdesc="Galgame Editing. Redefined | 视觉小说编辑，再进化"
arch=("aarch64"  "x86_64")
url="https://docs.openwebgal.com/guide/"
_githuburl="https://github.com/MakinoharaShoko/WebGAL_Terre"
license=('MPL2')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('cairo' 'mesa' 'libxrandr' 'libxcomposite' 'libdrm' 'libxdamage' 'nspr' 'glib2' 'at-spi2-core' 'nss' 'libcups' 'libxext' 'dbus' \
    'libxkbcommon' 'libx11' 'pango' 'java-runtime' 'alsa-lib' 'expat' 'gcc-libs' 'libxcb' 'libxfixes' 'glibc' 'gtk3' 'bash')
makedepends=('gendesk')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_githuburl}/releases/download/${pkgver}/${_appname}_Linux_Arm64_${pkgver}.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_githuburl}/releases/download/${pkgver}/${_appname}_Linux_${pkgver}.zip")
source=("LICENSE::https://raw.githubusercontent.com/MakinoharaShoko/WebGAL_Terre/${pkgver}/LICENSE")
sha256sums=('1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')
sha256sums_aarch64=('cb7784c2a3c85ecf517ac5b22bdcfe29e4eeed40b2018185ded80758c625556a')
sha256sums_x86_64=('9b3c63f8e6684e154d25e75e2c62e1b75e3f9a5fec65096341ec63341f84da52')
build() {
    gendesk -q -f -n --categories "Game;Utility" --name "${_appname//_/ }" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/release/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/assets/templates/WebGAL_Android_Template/app/src/main/ic_launcher-playstore.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"    
}