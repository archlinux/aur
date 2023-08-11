# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dopamine-bin
_appname=Dopamine
pkgver=3.0.0_preview19
pkgrel=2
pkgdesc="The audio player that keeps it simple"
arch=('x86_64')
url="https://github.com/digimezzo/dopamine"
license=(GPL3)
depends=('bash' 'electron17' 'hicolor-icon-theme')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver//_/-}/${_appname}-${pkgver//_preview19/-preview.19}.pacman"
    "${pkgname%-bin}.sh")
sha256sums=('60f58ec0aafc1c42c855311e4dd02e824c878f9bdc3afdb04222b15c926246b0'
            '618ccbddd87bf5083115917df65fe0e930ffb0b751487c872a9441987e3f0384')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}