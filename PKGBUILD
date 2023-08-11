# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=diffuse-player-bin
pkgver=3.3.0
pkgrel=5
pkgdesc="A music player that connects to your cloud/distributed storage."
arch=('x86_64')
url="https://diffuse.sh/"
_githuburl="https://github.com/icidasset/diffuse"
license=("PPL2")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('webkit2gtk' 'openssl' 'gcc-libs' 'gtk3' 'gdk-pixbuf2' 'pango' 'glibc' 'glib2' 'cairo')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-player-bin}-linux-amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/icidasset/diffuse/main/LICENSE")
sha256sums=('47703b10325b6e4d65960d573b1a6a8b04d992a523ce2b2605aae0ec0522bcd0'
            '22f6e9359127b271eba050bc6e87abc699982ace7a6b386c1c346c7f3154eda8')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-player-bin}" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/1716x1716/apps/${pkgname%-player-bin}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    sed "s|Exec=${pkgname%-player-bin}|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-player-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-player-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}