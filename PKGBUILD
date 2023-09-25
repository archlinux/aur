# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=google-docs-bin
_appname="Google Docs"
pkgver=2022.12.1
pkgrel=6
pkgdesc="Google Docs Desktop App made with electron. Includes Google Docs, Sheets, Slides, Forms, and Drive."
arch=("x86_64")
url="https://complabs.in/apps/google-docs"
_githuburl="https://github.com/Comp-Labs/Google-Docs"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('electron25' 'bash')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_appname// /-}-linux-amd64-${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/Comp-Labs/Google-Docs/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('ec35d80b9189ddfa095b108fc939490e0d2ef682036a82e7807679ae0b3a49d4'
            '22d8c1bb0c91f6cb8fa332a53a40d5223f7caa4b12af0029f4b0c2b65b6a1596'
            '0e2d6bf939ef31b05421d6ca1db883596cfb7971d422b501ff6c101ffcccf15b')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${_appname// /-}\" %U|${pkgname%-bin}|g;s|${_appname// /-}|${pkgname%-bin}|g;s|Category;|Utility;Office;|g" \
        -i "${srcdir}/usr/share/applications/${_appname// /-}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname// /-}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_appname// /-}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}