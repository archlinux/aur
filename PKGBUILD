# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=redis-viewer-bin
_pkgname=RedisViewer
_debname=com.redisviewer.RedisViewer
pkgver=3.4.0
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
sha256sums_aarch64=('fc45edc692e8bb4b801e6a90a8b5e3f508aafbc49b6f7aa52b6da307e58a600d')
sha256sums_x86_64=('053013d9334ca635712d0a1c269565c2e6a0d1cc09207a30db849b4a0482edd2')
prepare() {
    sed -i -e "
        s/Icon=${_debname}/Icon=${pkgname%-bin}/g
        s/Exec=redisviewer/Exec=${pkgname%-bin}/g
    " "${srcdir}/${_debname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/redisviewer" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/${_debname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
