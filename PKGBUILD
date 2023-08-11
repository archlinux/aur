# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=google-docs-bin
_appname="Google Docs"
pkgver=2022.12.1
pkgrel=4
pkgdesc="Google Docs Desktop App made with electron. Includes Google Docs, Sheets, Slides, Forms, and Drive."
arch=("x86_64")
url="https://complabs.in/apps/google-docs"
_githuburl="https://github.com/Comp-Labs/Google-Docs"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}-${pkgver}")
depends=('electron25' 'bash')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_appname// /-}-linux-amd64-${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/Comp-Labs/Google-Docs/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('ec35d80b9189ddfa095b108fc939490e0d2ef682036a82e7807679ae0b3a49d4'
            'cd44ddffb7c00b09fa102c9ce08213cda2af5fedb070e01d5975fd41665551c7'
            'b522edf0054310dc285b48c2b8a4c3f0eaf3547bda77d9b78a11fb787f353d5e')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${_appname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|\"/opt/${_appname}/${_appname// /-}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|${_appname// /-}|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname// /-}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname// /-}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_appname// /-}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}