# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dash-player-bin
_pkgname=DashPlayer
pkgver=5.1.3
_electronversion=29
pkgrel=1
pkgdesc="A video player designed specifically for English learning.(Prebuilt version)一款专为英语学习打造的视频播放器"
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
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/solidSpoon/DashPlayer/v${pkgver}/LICENSE"
)
sha256sums=('5e4c5518943705b922251557d64e3470e626d71360864c9758d044f3454753b9'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
prepare() {
    sed "/Comment/d" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed "3i\Comment=${pkgdesc}" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib}
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/usr/lib"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}