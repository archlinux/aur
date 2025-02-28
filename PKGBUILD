# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=md-minutes-generator-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Cross platform application for generating .md meeting minutes from .xlsx built with Tauri & Leptos.(Prebuilt version)一个从 Excel 格式的会议章程文件生成 Markdown 格式的会议记录模板的小工具"
arch=('x86_64')
url="https://github.com/SergeFan/md-minutes-generator"
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
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/SergeFan/md-minutes-generator/v${pkgver}/LICENSE"
)
sha256sums=('e12b7e708d6fbf733ffcce6447f3610ddee34f223565ea0feb8af55d69ebd1e0'
            '268916d2a22309db1bcd861a211a6c7dffd709021e55100cb65f0fe2cf2d5e5f')
prepare() {
    sed -i "s/Categories=/Categories=Utility;/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
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