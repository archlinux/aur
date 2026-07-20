# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chat2db-community-bin
_pkgname=Chat2DB-Community
pkgver=5.3.0
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
sha256sums_aarch64=('ec0dc5d63f514d846b81bafb66e1013889b9ec12f33a6dd31616ab1356b69663')
sha256sums_x86_64=('80b6562d632c972414d0dca00ed8fe0d5d21770fd029a8c3c6f2e8a0c81dfeef')
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
