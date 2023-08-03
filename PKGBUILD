# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wnr-bin
pkgver=1.30.1
pkgrel=1
pkgdesc="Work/Rest Timer. Stricter. Prettier. More features. "
arch=('x86_64')
url="https://getwnr.com/"
_githuburl="https://github.com/RoderickQiu/wnr"
license=('MPL2')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron22' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-Linux.AppImage"
    "LICENSE::https://raw.githubusercontent.com/RoderickQiu/wnr/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('148d7ef576a0af05b416ee05a82f5e63caca3136bd603e00a3a568f96b8f8e9c'
            '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5'
            '3ed021387a345b174939f407ba1fd5cee6fb51bed078ff7ad4e4081ab2b1651b')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}