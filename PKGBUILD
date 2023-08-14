# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Sofia Lima <me [at] dzshn [dot] xyz>
pkgname=vencord-desktop-bin
_appname=vencorddesktop
_pkgname="Vencord Desktop"
pkgver=0.2.9
pkgrel=1
pkgdesc="An Electron based Mastodon, Pleroma, and Misskey client"
arch=('x86_64')
url="https://github.com/Vencord/Desktop"
license=('GPL3')
depends=('bash' 'electron25')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname// /}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('31633bf0661318ed7a52a57b724fb4739358453df3bd6680d8d06cfe5aa611a8'
            '283634e33143121d09020e79dbe44d5380b7f976258e4a44ef772a2676affa04')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|\"/opt/${_pkgname}/${_appname}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}