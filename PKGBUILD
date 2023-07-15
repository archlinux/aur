# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monit-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="展示各种信息的桌面小组件"
arch=('x86_64')
url="https://monit.fzf404.art/"
_githuburl="https://github.com/fzf404/Monit"
license=('MIT')
provides=("${pkgname%-bin}")
conflits=("${pkgname%-bin}")
depends=('bash' 'electron21' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Monit-${pkgver}-linux-x86_64.AppImage"
    "LICENSE::https://raw.githubusercontent.com/fzf404/monit/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('380996cea6c85387a5d0f91bd725c32f7007ecf1ee0bb5f248bb998430f7877e'
            'ff7c320ce0d7663a98fe147ee42af554853380f3ba2a2aad67091bdbf895a276'
            '8e0386c7e9fe9a7133dd41b5430c70f2b3ec1a34d10765ae0df1579cf0b4900a')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}