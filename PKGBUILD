# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=duckling-bin
_pkgname=Duckling
pkgver=0.0.45
pkgrel=1
pkgdesc="A fast viewer for CSV/Parquet files and databases such as DuckDB, SQLite, PostgreSQL, MySQL, Clickhouse, etc.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/l1xnan/duckling"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/l1xnan/duckling/v${pkgver}/LICENSE"
)
sha256sums=('f78173471ffadcad234ecb1d4d6867fa292469541ceed2e2697823f0a458a2b0'
            'a57ebfdf4a7893bc2ba09a6f572c55a9f4052bebe8e6f33940df766ef61a1bcd')
prepare() {
    sed -i "s/Categories=/Categories=Development;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
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
