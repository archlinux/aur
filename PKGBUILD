# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="jimud-bin"
pkgver=1.0.1
pkgrel=2
pkgdesc="MUD client for ShadowMUD.com, based on webclient"
arch=("x86_64")
url="http://www.shadowmud.com/"
_githuburl="https://github.com/icewolfz/jiMUD"
license=('custom')
depends=('hicolor-icon-theme' 'bash' 'electron21' 'glibc' 'gcc-libs')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.rpm::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.${CARCH}.rpm"
    "${pkgname%-bin}.sh")
sha256sums=('9583babf6bf48d66a36d679ee71b53b4dd886c71d5f8b38e3763311f7c955303'
            '09947f3904b5ab387c8c8871a41053ec6ced5b549bf74122c9d375ae2e373dff')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/jiMUD/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|/opt/jiMUD/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/opt/jiMUD/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}