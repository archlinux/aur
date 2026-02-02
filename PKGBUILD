# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=insight-x-bin
pkgver=0.5.5
pkgrel=1
pkgdesc="A Tauri based data processing toolbox designed to simplify data operations and management,supports processing of multiple file formats, including Excel, CSV, Parquet, etc.(Prebuilt version)一个基于Tauri的数据处理工具箱，旨在简化数据操作和管理"
arch=('x86_64')
url="https://github.com/tansen87/insight-x"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tansen87/insight-x/v${pkgver}/LICENSE"
)
sha256sums=('b1a7bbca6ced172c4fdf6099c9820f1880ca81b64581344e24d0d14ca231005a'
            '40aef2075dd3e27889c8d2393daa9df182e5c7720d35cca6deec7b06354a805c')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "4i\Comment=${pkgdesc}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
