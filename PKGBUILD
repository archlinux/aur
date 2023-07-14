# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="google-docs-bin"
_appname="Google-Docs"
pkgver=2022.12.1
pkgrel=2
pkgdesc="Google Docs Desktop App made with electron. Includes Google Docs, Sheets, Slides, Forms, and Drive."
arch=("x86_64")
url="https://complabs.in/apps/google-docs"
_githuburl="https://github.com/Comp-Labs/Google-Docs"
license=('MIT')
depends=('electron25' 'bash')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Google-Docs-linux-amd64-${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/Comp-Labs/Google-Docs/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('ec35d80b9189ddfa095b108fc939490e0d2ef682036a82e7807679ae0b3a49d4'
            'cd44ddffb7c00b09fa102c9ce08213cda2af5fedb070e01d5975fd41665551c7'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm755 "${srcdir}//opt/Google Docs/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|\"/opt/Google Docs/${_appname}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|${_appname}|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_appname}.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}