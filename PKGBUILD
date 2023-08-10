# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=broadcast-bin
_appname="Cubic Broadcast"
pkgver=1.0.4
pkgrel=1
pkgdesc="Advanced tool for recording your desktop. Complete with overlay support."
arch=("x86_64")
url="https://github.com/Mobiz-Advanced-Technologies/Broadcast"
license=("AGPL3")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('75c4fdff330ea538f80648a849946c8de15d88d355621082fc68289aa6978b9d'
            '0ab1aab4e20a59e6af63785bf4b4e21eddb4668a610a34f44b62bc48597d3c78')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}