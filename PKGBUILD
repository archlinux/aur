# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vikunja-desktop-bin
pkgver=0.20.3
pkgrel=2
pkgdesc="The open-source, self-hostable to-do app.Organize everything, on all platforms."
arch=('x86_64')
url="https://vikunja.io/"
_githuburl="https://github.com/go-vikunja/desktop"
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.pacman::https://dl.vikunja.io/desktop/${pkgver}/Vikunja%20Desktop-${pkgver}.pacman"
    "${pkgname%-bin}.sh")
sha256sums=('136c619777568c683e509ee5956d7acf6d51a02995ff0f9b006c6488363416a2'
            'a2ed36ca78824762d9afba291e01116e65e939a3f37a99252e7f33652629dda5')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/Vikunja Desktop/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|\"/opt/Vikunja Desktop/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Productivity|Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}