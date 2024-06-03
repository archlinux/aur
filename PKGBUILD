# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dash-player-bin
_pkgname=DashPlayer
pkgver=4.2.3
_electronversion=29
pkgrel=1
pkgdesc="A video player designed specifically for English learning.一款专为英语学习打造的视频播放器"
arch=("x86_64")
url="https://solidspoon.xyz/app/dash-player/"
_ghurl="https://github.com/solidSpoon/DashPlayer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    #"electron${_electronversion}"
    'gtk3'
    'nss'
    'nspr'
    'alsa-lib'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/solidSpoon/DashPlayer/v${pkgver}/LICENSE"
)
sha256sums=('2c32227ffe9802895a58df898ee772e72622379c08d4bff4a7de2b535bbad1c2'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "/Comment/d" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed "3i\Comment=${pkgdesc}" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}