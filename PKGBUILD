# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=insightsql-bin
_pkgname=InsightSQL
pkgver=0.5.3
pkgrel=1
pkgdesc="Efficiently analyze Excel, CSV, Parquet files with Rust Polars SQL(Prebuilt version)一个可以使用polars SQL快速查看Excel、CSV和Parquet的工具,基于tauri"
arch=('x86_64')
url="https://github.com/tansen87/InsightSQL"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tansen87/InsightSQL/v${pkgver}/LICENSE"
)
sha256sums=('82342f9453b5f85ef27ec2d7cb593d06faf02c46412003e231866ac204233934'
            '40aef2075dd3e27889c8d2393daa9df182e5c7720d35cca6deec7b06354a805c')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "4i\Comment=${pkgdesc}/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
