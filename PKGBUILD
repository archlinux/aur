# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=goovpn-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Cross-platform gui (use wails) openvpn client."
arch=('x86_64')
url="https://github.com/Vai3soh/goovpn"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glib2' 'gtk3' 'bash' 'gcc-libs' 'glibc' 'gdk-pixbuf2' 'openssl' 'webkit2gtk')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('899fe424d78e34ba4fb7fff6e095d2968cba5f0d8f4d9d507bf0cf05f7b2bc8b')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.png|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/usr/sbin/${pkgname%-bin}" -t "${pkgdir}/usr/sbin"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}