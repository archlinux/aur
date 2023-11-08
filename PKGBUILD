# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=projscope-music-player-bin
_pkgname="Projscope MP3 Player"
pkgver=0.0.3
pkgrel=4
pkgdesc="Projscope MP3 player is free desktop, cross platform tool (Winamp you are remembered)!"
arch=("x86_64")
url="https://projscope.com/"
_githuburl="https://github.com/jviaches/projscope-music-player"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron17'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-0.0.1.${CARCH}.rpm"
    "LICENSE::https://raw.githubusercontent.com/jviaches/projscope-music-player/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('79493043f2ab40b625fe2f8e936cdc5779a5a86e15d458cde4709e92e12881e5'
            '1aa2a3326e734bc2595f638283ed58576d5358bf403f228b48d275b98abe1f3c'
            'b54bd96093f8c842548231fce8561817514aa0a5a243bad71701ec54745177d7')
build() {
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g;s|Audio|AudioVideo|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 192x192 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}