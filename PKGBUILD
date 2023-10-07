# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=icalingua++-bin
pkgver=2.10.6
pkgrel=1
pkgdesc="A branch of deleted Icalingua, with limited support"
arch=("aarch64" "armv7h" "x86_64")
url="https://github.com/Icalingua-plus-plus/Icalingua-plus-plus"
license=("AGPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-electron")
depends=('bash' 'electron22' 'gtk3' 'libnotify' 'libnss_nis' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.asar::${url}/releases/download/v${pkgver}/app-arm64.asar")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.asar::${url}/releases/download/v${pkgver}/app-armv7l.asar")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.asar::${url}/releases/download/v${pkgver}/app-x86_64.asar")
source=("${pkgname%-bin}.png::https://raw.githubusercontent.com/Icalingua-plus-plus/Icalingua-plus-plus/develop/pkgres/512x512.png"
    "${pkgname%-bin}.desktop::https://raw.githubusercontent.com/Icalingua-plus-plus/Icalingua-plus-plus/develop/pkgres/icalingua.desktop"
    "${pkgname%-bin}.sh")
sha256sums=('5743ef3d19be5e41e83c3a1171a807cd0505d7f5d5f9c5abdff8926dccadc6de'
            'b088d20934708c53e50492694efefbf9a9dcb62fefb8d1d4976f36f32f84af86'
            '4d151c3c5d48d7c63b29a1db87774819d39a3862cf23e2f7955a2a1104a6cb94')
sha256sums_aarch64=('5936cc5c5939f715f9d05f40e4b02ffc4d19ee6d3c22a99f404ebc490f2a0725')
sha256sums_armv7h=('a92b8a07efe5b33e81fab2395b30527dc23d070362b31ccbcd4d42cec84fe51b')
sha256sums_x86_64=('53f6f9e0b0786be3816995a59665dd74b45edff785ef08cc52f631e0704b6820')
prepare() {
    sed "s|${pkgname%++-bin} %u|${pkgname%-bin} %U|g;s|${pkgname%++-bin}.png|${pkgname%-bin}|g" -i "${srcdir}/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.asar" "${pkgdir}/opt/${pkgname%-bin}/resources/app.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}