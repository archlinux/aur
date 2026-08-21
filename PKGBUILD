# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chat2db-community-bin
_pkgname=Chat2DB-Community
pkgver=5.3.4
pkgrel=1
pkgdesc="🔥🔥🔥AI-driven database tool and SQL client, The hottest GUI client, supporting MySQL, Oracle, PostgreSQL, DB2, SQL Server, DB2, SQLite, H2, ClickHouse, and more.(Prebuilt version with bundled JRE)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://chat2db.ai/"
_ghurl="https://github.com/CodePhiliaX/Chat2DB"
license=('Apache-2.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'mesa'
    'at-spi2-core'
    'libxext'
    'libxi'
    'libxrandr'
    'libcups'
    'libxkbcommon'
    'nss'
    'nspr'
    'alsa-lib'
    'libxcomposite'
    'cairo'
    'pango'
    'libxdamage'
    'freetype2'
    'libxcursor'
)
options=(
    '!emptydirs'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.rpm")
sha256sums=('2f34cdc2dec53f3cc3cea02d56ab796ec3887ced306c8c2d8d80b23b7d5510f0')
sha256sums_aarch64=('659d3defb83871b87b8e1dfa2f60b85e492a125f35ccab79d679abb22a232175')
sha256sums_x86_64=('5a6ae24bfd850f31652e95ba0b0765a889e5d3ad9d17c63a0f0461505a96c088')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgnname//-/ }/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        /Exec=/d
        s/Icon=${_pkgname//-/ }/Icon=${pkgname%-bin}/g
        5i\Exec=${pkgname%-bin}
    " "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname//-/_}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"    
    cp -a "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"    
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname//-/_}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}/lib/${_pkgname//-/_}.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname//-/_}-MimeInfo.xml" \
        "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
}
