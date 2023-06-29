# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="icalingua++-electron-bin"
pkgver=2.9.20
pkgrel=1
pkgdesc="A branch of deleted Icalingua, with limited support"
arch=("aarch64" "armv7h" "x86_64")
url="https://github.com/Icalingua-plus-plus/Icalingua-plus-plus"
license=("AGPL3")
depends=('electron')
conflicts=("${pkgname%-electron-bin}" "${pkgname%-electron-bin}-appimage")
source_aarch64=("${pkgname%-electron-bin}-${pkgver}-aarch64.asar::${url}/releases/download/v${pkgver}/app-arm64.asar")
source_armv7h=("${pkgname%-electron-bin}-${pkgver}-armv7h.asar::${url}/releases/download/v${pkgver}/app-armv7l.asar")
source_x86_64=("${pkgname%-electron-bin}-${pkgver}-x86_64.asar::${url}/releases/download/v${pkgver}/app-x86_64.asar")
source=("${pkgname%-electron-bin}.png::https://raw.githubusercontent.com/Icalingua-plus-plus/Icalingua-plus-plus/develop/pkgres/512x512.png"
    "${pkgname%-electron-bin}.desktop::https://raw.githubusercontent.com/Icalingua-plus-plus/Icalingua-plus-plus/develop/pkgres/icalingua.desktop"
    "${pkgname%-electron-bin}.sh")
sha256sums=('5743ef3d19be5e41e83c3a1171a807cd0505d7f5d5f9c5abdff8926dccadc6de'
            'b088d20934708c53e50492694efefbf9a9dcb62fefb8d1d4976f36f32f84af86'
            'fa173daad247b6139b13417050086824d372bbb55ba93eace11bda4b1e1e0674')
sha256sums_aarch64=('6037d68378acc29a56d0cd24f1f06b3e655f5c1508c6d9eaa7cf199a3a56e212')
sha256sums_armv7h=('cbaa3c0c91ea04a9e7caf3f1ad59015089a643262f6170d9ca02e72828561b6b')
sha256sums_x86_64=('ccea81613be0b0c82374a02a1cad3ada74020d38d9335efb1176268d625104f4')

package() {
    install -Dm644 "${srcdir}/${pkgname%-electron-bin}-${pkgver}-${CARCH}.asar" "${pkgdir}/opt/${pkgname%-electron-bin}/${pkgname%-electron-bin}.asar"
    install -Dm755 "${srcdir}/${pkgname%-electron-bin}.sh" "${pkgdir}/opt/${pkgname%-electron-bin}/${pkgname%-electron-bin}"
    install -Dm644 "${srcdir}/${pkgname%-electron-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|Exec=icalingua %u|Exec=/opt/${pkgname%-electron-bin}/${pkgname%-electron-bin}|g;s|Icon=icalingua.png|Icon=${pkgname%-electron-bin}|g" \
        -i "${srcdir}/${pkgname%-electron-bin}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-electron-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}