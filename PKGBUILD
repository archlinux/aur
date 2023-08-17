pkgname=vencord-desktop-bin
_appname=vencorddesktop
_pkgname=Vesktop
_assetname=VencordDesktop
pkgver=0.3.0
pkgrel=2
pkgdesc="An Electron based Mastodon, Pleroma, and Misskey client"
arch=('x86_64')
url="https://github.com/Vencord/Vesktop"
license=('GPL3')
depends=('bash' 'electron25')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_assetname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('8dd9730ad5f638dfb95b478d68b185664a3130a19314eb79a9dc09edcb9dfbef'
            '283634e33143121d09020e79dbe44d5380b7f976258e4a44ef772a2676affa04')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|/opt/${_pkgname}/${_appname}|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}