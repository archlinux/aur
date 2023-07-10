# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="webgal-terre-bin"
pkgver=4.4.1
pkgrel=1
pkgdesc='Galgame Editing. Redefined | 视觉小说编辑，再进化'
arch=("x86_64")
url="https://docs.openwebgal.com/guide/"
_githuburl="https://github.com/MakinoharaShoko/WebGAL_Terre"
license=('MPL2')
depends=('cairo' 'mesa' 'libxrandr' 'libxcomposite' 'libdrm' 'libxdamage' 'nspr' 'glib2' 'at-spi2-core' 'nss' 'libcups' 'libxext' 'dbus' \
    'libxkbcommon' 'libx11' 'pango' 'java-runtime' 'alsa-lib' 'expat' 'gcc-libs' 'libxcb' 'libxfixes' 'glibc' 'gtk3')
makedepends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/${pkgver}/WebGAL_Terre_${pkgver}_Linux_Unstable.zip"
    "LICENSE::https://raw.githubusercontent.com/MakinoharaShoko/WebGAL_Terre/main/LICENSE")
sha256sums=('ed2f5b79591f36b2e4cb4b57aaecd67b60b78780ca8830403a0fc2d2e7b5419a'
            '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${pkgdir}/opt/${pkgname%-bin}" --gname root --uname root
    install -Dm644 "${srcdir}/${_appname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/assets/templates/WebGAL_Android_Template/app/src/main/ic_launcher-playstore.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Game;Utility" --name "WebGAL Terre" --exec "/opt/${pkgname%-bin}/WebGAL_Terre"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"    
}