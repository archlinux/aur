# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=manhuagui-downloader-bin
_zhsname='漫画柜下载器'
pkgver=0.4.2
pkgrel=1
pkgdesc="An tauri built application that can read comics, downloader, with graphical interface, support downloading hidden content, exporting PDF.(Prebuilt version)一个用于 manhuagui.com看漫画的下载器,带图形界面,支持下载隐藏内容、支持导出cbz和pdf"
arch=('x86_64')
url="https://github.com/lanyeeee/manhuagui-downloader"
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
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/lanyeeee/manhuagui-downloader/v${pkgver}/LICENSE"
)
sha256sums=('ad93a1ce4ff3317e9124c14f5d0a1f008528f7eac606ec8d4ad785e1fb1f604c'
            '4979304421019d6bdaf44503ef82021b8ecf51889135cc604dbfe3efe8eac904')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Categories=/Categories=Utility;/g
        6i\Name[zh_CN]=${_zhsname}
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}