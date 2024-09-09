# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=amphitheatre-desktop-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Open source GUI application that enables you to interact with Amphitheatre"
arch=(
    'aarch64'
    'i686'
    'x86_64'
)
url="https://github.com/amphitheatre-app/desktop"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'glibc>=2.38'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64.deb")
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-i386.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64.deb")
sha256sums_aarch64=('ca092e2126db852943533141a0442e537fa690632205a9a10404e069e944ed5a')
sha256sums_i686=('74d8863d27faf6f6bc8576aa0a6038337324ada72be4b1f4627bd6392e25d7a9')
sha256sums_x86_64=('42397e78e805511be5b3533d583645aa18e82b53602d52560634cb290a0bfc14')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s|/usr/local/bin/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/local/bin/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    for _icons in 8x8 16x16 22x22 24x24 32x32 36x36 42x42 48x48 64x64 72x72 128x128 160x160 192x192 256x256 384x384 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}