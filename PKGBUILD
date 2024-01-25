# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=icalingua++-bin
pkgver=2.11.1
_electronversion=22
pkgrel=1
pkgdesc="A branch of deleted Icalingua, with limited support"
arch=("aarch64" "armv7h" "x86_64")
url="https://github.com/Icalingua-plus-plus/Icalingua-plus-plus"
license=("AGPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-bin}-electron"
)
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.asar::${url}/releases/download/v${pkgver}/app-arm64.asar")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.asar::${url}/releases/download/v${pkgver}/app-armv7l.asar")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.asar::${url}/releases/download/v${pkgver}/app-x86_64.asar")
source=(
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/Icalingua-plus-plus/Icalingua-plus-plus/develop/pkgres/512x512.png"
    "${pkgname%-bin}-${pkgver}.desktop::https://raw.githubusercontent.com/Icalingua-plus-plus/Icalingua-plus-plus/develop/pkgres/icalingua.desktop"
    "${pkgname%-bin}.sh"
)
sha256sums=('5743ef3d19be5e41e83c3a1171a807cd0505d7f5d5f9c5abdff8926dccadc6de'
            'b088d20934708c53e50492694efefbf9a9dcb62fefb8d1d4976f36f32f84af86'
            '1d3f21d54a2d9d1a53661bd91c2afd00df79b0ce4057a66b4c953febfc464cd8')
sha256sums_aarch64=('5246762666e163cea99949768e609c40b93adc468c44c5cf94ad5ce09093fa4e')
sha256sums_armv7h=('10a5ecfa5d2a9fded85316c2c10d4c835a8d9a159179961b29ce1e4cb7f667ef')
sha256sums_x86_64=('7ad43df048471b1eb39982ca065eb0df15c04d7d40a12b78d6c2198c0dc90547')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s|${pkgname%++-bin}.png|${pkgname%-bin}|g;s|Exec=${pkgname%++-bin} %u|Exec=${pkgname%-bin} %U|g" -i "${srcdir}/${pkgname%-bin}-${pkgver}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.asar" "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}