# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jmcomic-downloader-bin
_pkgname='禁漫天堂下载器'
pkgver=0.14.2
pkgrel=1
pkgdesc="禁漫天堂 18comic.vip jmcomic 18comic 的多线程下载器,带图形界面,已打包exe,带收藏夹,免费下载收费的漫画,下载速度飞快.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/lanyeeee/jmcomic-downloader"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/lanyeeee/jmcomic-downloader/v${pkgver}/LICENSE"
)
sha256sums=('31b89bc8375e5f59cf5c2f09215d9d011a6fa93d8e04d3315e1f12c7b10871bf'
            '541954d98234bfc993f9cfcd1cf0d8d6b6e06a9375208a6b2a83a6663aa65ee8')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Categories=/Categories=Utility;/g
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