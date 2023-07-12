# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname="youtube-music"
pkgname="electron-${_appname}-bin"
pkgver=1.0.0
pkgrel=2
pkgdesc="A minimal electron app for Youtube Music"
arch=('x86_64')
url="https://github.com/pauchiner/electron-youtube-music"
license=('custom')
depends=('electron23')
makedepends=('gendesk')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Linux.deb"
    "${pkgname%-bin}.sh")
sha256sums=('7f12ca29771515ff0735af72b639d7c1bb609e14b7dd69d506e65a11a03c1cc3'
            '64b897d514891cfc8dac8a9172a34f9c9069482b27af91a2fa640bccde61c9ba')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/Youtube Music/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|\"/opt/Youtube Music/${_appname}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|=${_appname}|=${pkgname%-bin}|g;s|Music;|AudioVideo;|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/Youtube Music/"LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}