# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="thedesk-bin"
pkgver=24.1.3
pkgrel=1
pkgdesc="Mastodon Client for PC."
arch=("x86_64")
url="https://thedesk.top/"
_githuburl="https://github.com/cutls/TheDesk"
license=('GPL3')
depends=('electron' 'hicolor-icon-theme' 'zsh')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('16afa40dd351ec6d056e2fbe3851b161b80514e9e9773c72d09561e6dfe2f21b'
            'd1f070b3fe19048a6641cd3c07e7a1e55473a82742181f3de75eeb68ed3b3aa4')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm0755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/TheDesk/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr" "${pkgdir}"
    install -Dm0755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    sed "s|Exec=/opt/TheDesk/${pkgname%-bin} %U|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}