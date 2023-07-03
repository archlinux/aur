# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="icalingua++-electron-bin"
pkgver=2.9.21
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
sha256sums_aarch64=('d1fe31e560100b521f7d9d2410dcdc9d7dddaf9932f47f6bf8605fd8a7d018bc')
sha256sums_armv7h=('c8f42aa7276780d0a5cebdbd1fbb58fbe5fd90423f163a0692a1ad490bac29d0')
sha256sums_x86_64=('32232d693de719a6dfe6f3941fd14bc39a742b70da89bb61178c87aefe73d5ec')

package() {
    install -Dm644 "${srcdir}/${pkgname%-electron-bin}-${pkgver}-${CARCH}.asar" "${pkgdir}/opt/${pkgname%-electron-bin}/${pkgname%-electron-bin}.asar"
    install -Dm755 "${srcdir}/${pkgname%-electron-bin}.sh" "${pkgdir}/opt/${pkgname%-electron-bin}/${pkgname%-electron-bin}"
    install -Dm644 "${srcdir}/${pkgname%-electron-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|Exec=icalingua %u|Exec=/opt/${pkgname%-electron-bin}/${pkgname%-electron-bin}|g;s|Icon=icalingua.png|Icon=${pkgname%-electron-bin}|g" \
        -i "${srcdir}/${pkgname%-electron-bin}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-electron-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}