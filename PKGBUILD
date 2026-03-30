# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=amphitheatre-desktop-bin
pkgver=0.11.3
pkgrel=1
pkgdesc="Open source GUI application that enables you to interact with Amphitheatre.(Prebuilt version)"
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
    'libgcc'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64.rpm")
source_i686=("${pkgname%-bin}-${pkgver}-i686.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-i386.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64.rpm")
sha256sums_aarch64=('d2afb90d6ea4c9e847e0104d8a2d196eeec99c377ace7cc836bdfddd0a769d3e')
sha256sums_i686=('b3d598dcb5b121d2b4652467019be6a9af52d60325d59ab6a0641f9194c8d2f6')
sha256sums_x86_64=('46b9e39e04761df91675a9259d7ff29cc0840bad29e8df2a724181cd1450b4bd')
prepare() {
    sed -i "s/\/usr\/local\/bin\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/local/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(8x8 16x16 22x22 24x24 32x32 36x36 42x42 48x48 64x64 72x72 128x128 160x160 192x192 256x256 384x384 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
