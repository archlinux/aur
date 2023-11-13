# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chord-bin
pkgver=0.2.40
pkgrel=10
pkgdesc="A Modern Music Player.弦 - 一个现代音乐播放器,提供很多音乐服务商/播客的服务,也支持本地音乐文件的播放."
arch=('x86_64')
url="https://github.com/PeterDing/chord"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'electron18'
)
source=(
    "${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.pacman"
  "LICENSE::https://raw.githubusercontent.com/PeterDing/chord/v${pkgver}/LICENSE"
  "${pkgname%-bin}.sh"
)
sha256sums=('5eaf015a5634c29b0dcf3192b226eaa96f7a247ccd23af366dffdd6204e41378'
            'aab9ba9322a4e18a0018d15f83b99c7b10d77d5e301579fc249efef89bc2836c'
            '15cba42f2a61e6921d64f73f10095f7afd09d5effa4d3e1681fc75434507f12f')
build() {
    sed "s|=Music|=AudioVideo|g;s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}