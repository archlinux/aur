# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="projscope-music-player-bin"
pkgver=0.0.3
pkgrel=2
pkgdesc="Projscope MP3 player is free desktop, cross platform tool (Winamp you are remembered)!"
arch=("x86_64")
url="https://projscope.com/"
_githuburl="https://github.com/jviaches/projscope-music-player"
license=('MIT')
depends=('bash' 'electron17' 'hicolor-icon-theme')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.rpm::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-0.0.1.${CARCH}.rpm"
    "LICENSE::https://raw.githubusercontent.com/jviaches/projscope-music-player/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('79493043f2ab40b625fe2f8e936cdc5779a5a86e15d458cde4709e92e12881e5'
            '1aa2a3326e734bc2595f638283ed58576d5358bf403f228b48d275b98abe1f3c'
            'aa9d6f09b19c4051ce9718c30efc8ecdf4a695a60bcd677344f8b644e3d7eecf')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/opt/Projscope MP3 Player/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 16x16 32x32 192x192 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|\"/opt/Projscope MP3 Player/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}