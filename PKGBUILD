# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yesplaymusic-bin
_pkgname=YesPlayMusic
pkgver=0.4.7
pkgrel=2
pkgdesc="高颜值的第三方网易云播放器，支持 Windows / macOS / Linux。"
arch=('x86_64')
url="https://music.qier222.com/"
_githuburl="https://github.com/qier222/YesPlayMusic"
license=('MIT')
depends=('hicolor-icon-theme' 'bash' 'electron13')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-electron" "${pkgname%-bin}osd-electron" "${pkgname%-bin}osd-origin" "r3play")
source=("${pkgname%-bin}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman"
    "LICENSE::https://raw.githubusercontent.com/qier222/YesPlayMusic/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('9b9fc793354e2bcd677b31a7d29e7e5006479fdf7b89c8adfac1e17d072cd2c9'
            'c33378c6fd12e6d040cedd06dc0d1bedfca74fd66bc46cc2cf10cc10e0906be6'
            '7298ed6025119418bfb19882f9266f56c6d4c401d15710f5b12ea6f58f0d960a')
prepare() {
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g;s|Music|AudioVideo|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 16x16 24x24 32x32 48x48 64x64 88x88 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}