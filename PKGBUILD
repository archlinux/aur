# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monit-bin
_appname=Monit
pkgver=0.8.1
pkgrel=3
pkgdesc="Desktop widgets that display various information.展示各种信息的桌面小组件"
arch=('x86_64')
url="https://monit.fzf404.art/"
_githuburl="https://github.com/fzf404/Monit"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron21' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-${CARCH}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/fzf404/monit/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('380996cea6c85387a5d0f91bd725c32f7007ecf1ee0bb5f248bb998430f7877e'
            'ff7c320ce0d7663a98fe147ee42af554853380f3ba2a2aad67091bdbf895a276'
            '11f0c5dec85e2cfbefa42fd07e3c8574972c72ce927f69748fc6d0d52afbed02')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}