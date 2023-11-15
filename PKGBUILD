# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mbcord-bin
pkgver=3.0.7
pkgrel=4
pkgdesc="An Emby/Jellyfin rich presence client for Discord"
arch=('x86_64')
url="https://mbcord.sandwichfox.de/"
_ghurl="https://github.com/SandwichFox/MBCord"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron25'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/SandwichFox/MBCord/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('f93b47d1384c217115373c2e6a4cb93f000aa54687fed7013d8bc91eecc386cd'
            '25f147af5b79f33fbdfbc0b16dcae3db7d19fa67b58f7a95c3d5cabe8638d011'
            'bcfad760e14e094c37d67229bc0c482d18a0d129ac9cca4f90bfe4d85bbd5c89')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}