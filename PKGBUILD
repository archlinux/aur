# Maintainer: Shreyans Jain <shreyansthebest2007@gmail.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=google-assistant-unofficial-desktop-client-bin
_appname=g-assist
pkgver=1.1.0
pkgrel=4
pkgdesc="A cross-platform unofficial Google Assistant Client for Desktop (powered by Google Assistant SDK)"
arch=('x86_64')
url="https://github.com/Melvin-Abraham/Google-Assistant-Unofficial-Desktop-Client"
license=('Apache')
depends=('electron10' 'hicolor-icon-theme' 'bash')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::$url/releases/download/v$pkgver/Google-Assistant-Setup-$pkgver-amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('97ef51b6950d14ac0bc34aa5705b125b09d67d0f5e5cafa686f7757ff751a510'
            '800a531a80f3781dda1c85288de861e6a4441693a80bc9a338ef88277dae57d1')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm755 "${srcdir}//opt/Google Assistant/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|\"/opt/Google Assistant/${_appname}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|${_appname}|${pkgname%-bin}|g;s|Productivity|Utility|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}