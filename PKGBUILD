# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bili-shadowreplay-bin
_pkgname='BiliBili ShadowReplay'
pkgver=2.3.0
pkgrel=1
pkgdesc="A tool for caching bilibili live broadcasts and editing submissions in real time.(Prebuilt version)一个B站缓存直播并进行实时编辑投稿的工具"
arch=('x86_64')
url="https://github.com/Xinrea/bili-shadowreplay"
license=('LicenseRef-unknown')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
)
sha256sums=('039f12122d8b7ae3b4813db8749404bc90727c290f95ec1faf8e963ea4f9d56e')
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
}