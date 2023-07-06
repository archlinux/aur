# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ahmyth-bin
_ver=beta.4
pkgver="1.0${_ver}"
pkgrel=3
pkgdesc="Cross-Platform Android Remote Administration Tool"
arch=("i686" "x86_64")
url="https://github.com/Morsmalleo/AhMyth"
license=('GPL3')
depends=('electron' 'hicolor-icon-theme')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source=("${pkgname%-bin}.sh")
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${url}/releases/download/v${pkgver%${_ver}}-${_ver}/AhMyth-Setup_i386-Linux.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver%${_ver}}-${_ver}/AhMyth-Setup_amd64-Linux.deb")
sha256sums=('a7cffbd41f630d53e307f289e20ff29946d08ed1fc45a9f1df1ce96320f3e845')
sha256sums_i686=('875f24403471f583214c288e50850bea5ce2fad1a4bed3234fb34e59b0396942')
sha256sums_x86_64=('b98abfefb1e1ff402b3a9b561c081008e314ff8c3f072c10d9734725a55c06ab')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm644 "${srcdir}/opt/AhMyth/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    sed "s|/opt/AhMyth/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    cp -r "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"
}