# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Sofia Lima <me [at] dzshn [dot] xyz>
pkgname=vencord-desktop-bin
_appname=vencorddesktop
pkgver=0.2.8
pkgrel=1
pkgdesc="An Electron based Mastodon, Pleroma, and Misskey client"
arch=('x86_64')
url="https://github.com/Vencord/Desktop"
license=('GPL3')
depends=('bash' 'electron25')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/VencordDesktop_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('39491725f52de4b372e3b62d9f9dcdf5a51e0b357ba406840625803bc80518c5'
            '283634e33143121d09020e79dbe44d5380b7f976258e4a44ef772a2676affa04')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/Vencord Desktop/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|\"/opt/Vencord Desktop/${_appname}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}