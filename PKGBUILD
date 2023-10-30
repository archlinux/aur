# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=muffon-bin
pkgver=2.0.0
pkgrel=2
pkgdesc="Music streaming browser,retrieves audio, video and metadata from various Internet sources."
arch=('x86_64')
url="https://muffon.netlify.app/"
_githuburl="https://github.com/staniel359/muffon"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron27' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.pacman"
    "LICENSE::https://raw.githubusercontent.com/staniel359/muffon/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('1dd4e40209a9c999bfaa4cf4ef4ae8b9994915626154c9544468eca8112659dd'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
            '94c9502f6922a4fe4c58e0dc24679afcd7ae563cf8c42a7110462d3a708981cc')
build() {
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin}|g;s|Audio;|AudioVideo;|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}