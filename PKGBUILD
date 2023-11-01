# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=icalingua++-bin
pkgver=2.10.7
pkgrel=1
pkgdesc="A branch of deleted Icalingua, with limited support"
arch=("aarch64" "armv7h" "x86_64")
url="https://github.com/Icalingua-plus-plus/Icalingua-plus-plus"
license=("AGPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-electron")
depends=(
    'bash'
    'electron22'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.asar::${url}/releases/download/v${pkgver}/app-arm64.asar")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.asar::${url}/releases/download/v${pkgver}/app-armv7l.asar")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.asar::${url}/releases/download/v${pkgver}/app-x86_64.asar")
source=("${pkgname%-bin}.png::https://raw.githubusercontent.com/Icalingua-plus-plus/Icalingua-plus-plus/develop/pkgres/512x512.png"
    "${pkgname%-bin}.desktop::https://raw.githubusercontent.com/Icalingua-plus-plus/Icalingua-plus-plus/develop/pkgres/icalingua.desktop"
    "${pkgname%-bin}.sh")
sha256sums=('5743ef3d19be5e41e83c3a1171a807cd0505d7f5d5f9c5abdff8926dccadc6de'
            'b088d20934708c53e50492694efefbf9a9dcb62fefb8d1d4976f36f32f84af86'
            '6c08d6bce8a280fddd642d0b177ad4ecc5a0a7d572a303c4532cf499c9666a01')
sha256sums_aarch64=('e79dabad7bab49dfee918dc6f897c35b48bcbf6d29f5a5d313186bfe2efd19e2')
sha256sums_armv7h=('a749c2332729d1e8938a3464690ac847295c5807da4589712210c97c25eca076')
sha256sums_x86_64=('96baaae9449084f6a1f4831d4fac040d3f2b50c98cb8437dad4105da655d1620')
build() {
    sed "s|${pkgname%++-bin} %u|${pkgname%-bin} %U|g;s|${pkgname%++-bin}.png|${pkgname%-bin}|g" -i "${srcdir}/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.asar" "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}