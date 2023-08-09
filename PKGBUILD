# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deltachat-desktop-bin
_appname=DeltaChat
pkgver=1.39.0
pkgrel=2
pkgdesc="Email-based instant messaging for Desktop."
arch=('x86_64')
url="https://delta.chat/"
_githuburl="https://github.com/deltachat/deltachat-desktop"
license=('GPL3')
provides=("${pkgname%-desktop-bin}=${pkgver}" "${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron22' 'hicolor-icon-theme' 'gcc-libs' 'glibc')
source=("${pkgname%-bin}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman"
    "${pkgname%-bin}.sh")
sha256sums=('57885476ed3db8092a506bb53b8a46ddaa9149ad6f8f7fdc6c05df7cb12d683f'
            '5b50778ad1e821f8865828e9a3ce399a1d3a746ef829f564b1d5c4ab82b1bb2a')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}