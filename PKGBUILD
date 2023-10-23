# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jimud-bin
_pkgname=jiMUD
pkgver=1.1.0
pkgrel=1
pkgdesc="MUD client for ShadowMUD.com, based on webclient"
arch=("x86_64")
url="http://www.shadowmud.com/"
_githuburl="https://github.com/icewolfz/jiMUD"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron27' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.rpm::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.${CARCH}.rpm"
    "${pkgname%-bin}.sh")
sha256sums=('545aa39aec7aafd129f78c90645df94c2b14f05edca966233ff87fec4eea256b'
            '6d63494258c566a99b47f8934321a7f85424868bdf69034a58af2b728d62e1f4')
build() {
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}