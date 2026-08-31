# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=redis-viewer-bin
_pkgname=RedisViewer
_debname=io.github.redisviewer
pkgver=3.2.4
pkgrel=1
pkgdesc="A Redis visualization client tool that pursues ultimate performance, minimalist layout, efficient interaction, cross platform, and supports deserialization of Java bytecode.Prebuilt version"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/redisviewer/RedisViewer"
license=('LicenseRef-unknown')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
options=(
    '!strip'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64_bin.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64_bin.tar.gz")
sha256sums_aarch64=('eb97bd942e453000339625696d381c2196f4019e75a69f3eb6e3991823861938')
sha256sums_x86_64=('9002e83fb9154e80ddb26277dc4c2236eec3730359f4343428d9200a73fdbef9')
prepare() {
    sed -i "s/Icon=${_debname}/Icon=${pkgname%-bin}/g" "${srcdir}/${_debname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/${_debname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
