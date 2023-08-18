# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=webgal-terre-bin
_appname=WebGAL_Terre
pkgver=4.4.3.1
pkgrel=1
pkgdesc="Galgame Editing. Redefined | 视觉小说编辑，再进化"
arch=("aarch64"  "x86_64")
url="https://docs.openwebgal.com/guide/"
_githuburl="https://github.com/MakinoharaShoko/WebGAL_Terre"
license=('MPL2')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('cairo' 'mesa' 'libxrandr' 'libxcomposite' 'libdrm' 'libxdamage' 'nspr' 'glib2' 'at-spi2-core' 'nss' 'libcups' 'libxext' 'dbus' \
    'libxkbcommon' 'libx11' 'pango' 'java-runtime' 'alsa-lib' 'expat' 'gcc-libs' 'libxcb' 'libxfixes' 'glibc' 'gtk3')
makedepends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.zip")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_githuburl}/releases/download/${pkgver}/${_appname}_Linux_Arm64_${pkgver}.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_githuburl}/releases/download/${pkgver}/${_appname}_Linux_${pkgver}.zip")
source=("LICENSE::https://raw.githubusercontent.com/MakinoharaShoko/WebGAL_Terre/main/LICENSE")
sha256sums=('1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')
sha256sums_aarch64=('856e0d58491c25ff188cf38112428c202906c487945700aef935a0266c830e8b')
sha256sums_x86_64=('ff4884270a9a619cb7aaad9f73899fea0e78f59f254323bbcd463ef703f11e10')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${pkgdir}/opt/${pkgname%-bin}" --gname root --uname root
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/assets/templates/WebGAL_Android_Template/app/src/main/ic_launcher-playstore.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Game;Utility" --name "${_appname//_/ }" --exec "/opt/${pkgname%-bin}/${_appname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"    
}