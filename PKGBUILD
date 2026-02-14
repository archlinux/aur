# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=youwee-bin
_pkgname=Youwee
pkgver=0.9.4
pkgrel=1
pkgdesc="A beautifull YouTube, TikTok, Instagram and 1800+ sites downloader (yt-dlp GUI) and AI summary video content for cross-platform."
arch=('x86_64')
url="https://github.com/vanloctech/youwee"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'yt-dlp'
    'ffmpeg'
    'bun'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-Linux.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/vanloctech/youwee/v${pkgver}/LICENSE"
)
sha256sums=('2f52b50b07e9b6291e0f68503390b0eb8986e12d0a5b08e2e4499eb300518aba'
            '1cea78a161f726406b7611610171f5ac0e42b620126334e1150084179faf5b7b')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/Categories=/Categories=AudioVideo;Utility/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
