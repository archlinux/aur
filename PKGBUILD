# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="icalingua++-electron-bin"
pkgver=2.9.19
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
sha256sums_aarch64=('828060b129d72d6531002dc3211e12a3c08cb41ac71c994c34c8e58f0b9f4c5f')
sha256sums_armv7h=('345c3997de83035709da237ec703fdcce4d267564541c2870c5c13943014f403')
sha256sums_x86_64=('84f458fac40816965d3489d1092e092d771203775febc143805e959c02b30676')

package() {
    install -Dm644 "${srcdir}/${pkgname%-electron-bin}-${pkgver}-${CARCH}.asar" "${pkgdir}/opt/${pkgname%-electron-bin}/${pkgname%-electron-bin}.asar"
    install -Dm755 "${srcdir}/${pkgname%-electron-bin}.sh" "${pkgdir}/opt/${pkgname%-electron-bin}/${pkgname%-electron-bin}"
    install -Dm644 "${srcdir}/${pkgname%-electron-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|Exec=icalingua %u|Exec=/opt/${pkgname%-electron-bin}/${pkgname%-electron-bin}|g;s|Icon=icalingua.png|Icon=${pkgname%-electron-bin}|g" \
        -i "${srcdir}/${pkgname%-electron-bin}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-electron-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}