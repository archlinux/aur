# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bili-shadowreplay-bin
_pkgname='BiliBili ShadowReplay'
pkgver=2.14.0
pkgrel=1
pkgdesc="A tool for caching bilibili live broadcasts and editing submissions in real time.(Prebuilt version)一个B站缓存直播并进行实时编辑投稿的工具"
arch=('x86_64')
url="https://github.com/Xinrea/bili-shadowreplay"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Xinrea/bili-shadowreplay/v${pkgver}/LICENSE"
)
sha256sums=('48173be2aa687fd8850a7f0c7710037df1b34b8bc01af7bcab87a3b777cddab5'
            '94554e2faa839f3486528d64507d3ee5c1c0a9657c92def6dc9d30d3b46b4dc6')
prepare() {
    sed -i -e "
        s/Comment=${_pkgname}/Comment=${pkgdesc}/g
        s/Categories=/Categories=AudioVideo;/g
        s/Name=${pkgname%-bin}/Name=${_pkgname}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
