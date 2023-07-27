# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="thedesk-bin"
pkgver=24.1.3
pkgrel=3
pkgdesc="Mastodon Client for PC."
arch=("x86_64")
url="https://thedesk.top/"
_githuburl="https://github.com/cutls/TheDesk"
license=('GPL3')
depends=('electron22' 'hicolor-icon-theme' 'bash')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('16afa40dd351ec6d056e2fbe3851b161b80514e9e9773c72d09561e6dfe2f21b'
            '2740f8c2fa29d25fb285ba80b0dbdeffffd1be6b52db4908c51242bf953bb43c')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm0755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/TheDesk/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr" "${pkgdir}"
    install -Dm0755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    sed "s|Exec=/opt/TheDesk/${pkgname%-bin} %U|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}