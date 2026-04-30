# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=noir
pkgname="${_appname}db-bin"
_pkgname=Noir
pkgver=2.3.0
pkgrel=1
pkgdesc="🕵️‍♂️ Noir - keyboard driven database management client for Postgresql, MySQL, MariaDB, SQLite and Clickhouse. (Prebuilt version)"
arch=('x86_64')
url="https://noirdb.dev/"
_ghurl="https://github.com/invm/noir"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('99894d9f9a7bde3476a4362c8c0e1b88948ad1a3d832450b8571efd8f1bdab9e')
prepare() {
    sed -i -e "
        s/Categories=/Categories=Development;Database;/g
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256@2/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
