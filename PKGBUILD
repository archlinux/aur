# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=redis-viewer-bin
_pkgname=RedisViewer
_debname=io.github.redisviewer
pkgver=3.2.2
pkgrel=1
pkgdesc="A Redis visualization client tool that pursues ultimate performance, minimalist layout, efficient interaction, cross platform, and supports deserialization of Java bytecode.Prebuilt version"
arch=('x86_64')
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
source=(
    "${pkgname%-bin}-${pkgver}.flatpak::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.flatpak"
    "flatpak_unpack.py"
)
sha256sums=('f2e3efea82e8819998d1a063eebbc9297392ad3b4c4ec9fd31975fee0cdab6d1'
            '25952d131dc9d9da14e84a99b83da66c2c6e2e067569599972901d7704297feb')
prepare() {
    cd "${srcdir}"
    python3 flatpak_unpack.py "${pkgname%-bin}-${pkgver}.flatpak"
    sed -i "s/Icon=${_debname}/Icon=${pkgname%-bin}/g" "${srcdir}/flatpak_unpacked/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/flatpak_unpacked/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/flatpak_unpacked/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/flatpak_unpacked/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}