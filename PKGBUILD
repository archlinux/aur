# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tess-bin
pkgver=0.7_alpha.4
pkgrel=3
pkgdesc="A hackable, simple, rapid and beautiful terminal for the new era of technology."
arch=('i686' 'x86_64')
url="https://tessapp.dev/discord"
_githuburl="https://github.com/SquitchYT/Tess"
license=('MPL2')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'cairo' 'gcc-libs' 'dbus' 'openssl-1.1' 'webkit2gtk' 'glib2' 'gdk-pixbuf2' 'gtk3')
makedepends=('gendesk')
source_i686=("${pkgname%-bin}-${pkgver}-i686::${_githuburl}/releases/download/${pkgver//_/-}/${pkgname%-bin}-i686-unknown-linux-gnu")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${_githuburl}/releases/download/${pkgver//_/-}/${pkgname%-bin}-x86_64-unknown-linux-gnu")
source=("LICENSE::https://raw.githubusercontent.com/SquitchYT/tess/${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/SquitchYT/Tess/${pkgver//_/-}/src/ressources/img/default.png")
sha256sums=('1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5'
            '58a610a3a39e4421be5c05e95aeb253e2c1a70193eace4c78a49e654ace0aabc')
sha256sums_i686=('68df1fb6399cbd420a166c0c8b2534d6b63b5fbea5d265ffae4accea6f8f040d')
sha256sums_x86_64=('9d8de11bcd89e2d611ece9f042c2725f032c6e1a1c7cb71ff0b81e24c8fdfbe8')
prepare() {
    gendesk -f -n --categories "System;Utility" --name "Tess" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}