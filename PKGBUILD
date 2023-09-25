# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# CO-Maintainer: HentaiShiroYuki <hentaishiroyuki at gmail dot com>
# Contributor: Sofia Lima
pkgname=vencord-desktop-bin
_appname=vencorddesktop
_pkgname=Vesktop
_assetname="VencordDesktop"
pkgver=0.3.1
pkgrel=1
pkgdesc="A cross platform electron-based desktop app aiming to give you a snappier Discord experience with Vencord pre-installed"
arch=('x86_64')
url="https://github.com/Vencord/Vesktop"
license=('GPL3')
depends=('bash' 'electron25')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_assetname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('6907fa299ea2a2c54cceb580d364a3ced150ec8742d30c9bbc7f27c09b3e0876'
            'e5584dfcc4e47d4001b77da837a9171e13b956a99cb0e98f1309c4a25dceeabb')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${_appname} %U|${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}