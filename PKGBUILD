# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=icalingua++-bin
pkgver=2.12.23
_electronversion=22
pkgrel=1
pkgdesc="A branch of deleted Icalingua, with limited support.Prebuilt version.Use system-wide electron."
arch=(
    "aarch64"
    "armv7h"
    "x86_64"
)
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
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('1f518a4a8f771e871dba18a54eed763d8b79afa52d314a2802ace7a0a04da18b')
sha256sums_armv7h=('e38d7e5b4d1c581cbda1bf42b2cbea91a3ff5baabded8fab578afaae46476e5c')
sha256sums_x86_64=('58c1f1fa548b085ca082ebff41e6a13f1a710a9608f8f4c09002ebb3ab313d15')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -e "
        s/${pkgname%++-bin}.png/${pkgname%-bin}/g
        s/Exec=${pkgname%++-bin} %u/Exec=${pkgname%-bin} %U/g
    " -i "${srcdir}/${pkgname%-bin}-${pkgver}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.asar" "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
