# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# CO-Maintainer: HentaiShiroYuki <hentaishiroyuki at gmail dot com>
# Contributor: Sofia Lima
pkgname=vencord-desktop-bin
_appname=vencorddesktop
_pkgname=Vesktop
_assetname="${_pkgname}Desktop"
pkgver=0.3.0
pkgrel=3
pkgdesc="A cross platform electron-based desktop app aiming to give you a snappier Discord experience with Vencord pre-installed"
arch=('x86_64')
url="https://github.com/Vencord/Vesktop"
license=('GPL3')
depends=('bash' 'electron25')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_assetname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('8dd9730ad5f638dfb95b478d68b185664a3130a19314eb79a9dc09edcb9dfbef'
            'e5584dfcc4e47d4001b77da837a9171e13b956a99cb0e98f1309c4a25dceeabb')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${_appname}|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}