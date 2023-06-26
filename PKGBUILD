# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="icalingua++-electron-bin"
pkgver=2.9.18
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
            'db782695e4b12d7fa1cb6c0a9468eb47781b3f34cd8c37061bdbf847fe0f9f2f')
sha256sums_aarch64=('16d116308c7ee86b404762739a8ecadc70bc06fa281b88cc84f437cd71c93647')
sha256sums_armv7h=('9ec70ccd0d2bec6b8b75e1a226936f8a86d1c15628ed78795db784e8e3927122')
sha256sums_x86_64=('6ca0f9dcb12864135986146bf378cfcbfed7a3ab70072b2eb4e59b672f26ab76')

package() {
    install -Dm644 "${srcdir}/${pkgname%-electron-bin}-${pkgver}-${CARCH}.asar" "${pkgdir}/opt/${pkgname%-electron-bin}/${pkgname%-electron-bin}.asar"
    install -Dm755 "${srcdir}/${pkgname%-electron-bin}.sh" "${pkgdir}/opt/${pkgname%-electron-bin}/${pkgname%-electron-bin}"
    install -Dm644 "${srcdir}/${pkgname%-electron-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|Exec=icalingua %u|Exec=/opt/${pkgname%-electron-bin}/${pkgname%-electron-bin}|g;s|Icon=icalingua.png|Icon=${pkgname%-electron-bin}|g" \
        -i "${srcdir}/${pkgname%-electron-bin}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-electron-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}