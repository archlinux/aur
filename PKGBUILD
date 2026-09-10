# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=redis-viewer-bin
_pkgname=RedisViewer
_debname=com.redisviewer.RedisViewer
pkgver=3.3.0
pkgrel=1
pkgdesc="A Redis visualization client tool that pursues ultimate performance, minimalist layout, efficient interaction, cross platform, and supports deserialization of Java bytecode."
arch=(
    'aarch64'
    'x86_64'
)
url="https://redisviewer.com/"
_ghurl="https://github.com/redisviewer/RedisViewer"
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64_bin.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64_bin.tar.gz")
sha256sums_aarch64=('26270483a8d8620c60116d00c3df76081a62fc7647245dfe650aa95ee9874703')
sha256sums_x86_64=('82ad1618eb852b1d508502e2bc2e31a1f29d9ea2c23b0df8751bb02d906d84f4')
prepare() {
    sed -i "s/Icon=${_debname}/Icon=${pkgname%-bin}/g" "${srcdir}/${_debname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/${_debname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
