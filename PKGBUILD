# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=amphitheatre-desktop-bin
pkgver=0.9.9
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
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64.rpm")
source_i686=("${pkgname%-bin}-${pkgver}-i686.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-i386.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64.rpm")
sha256sums_aarch64=('efc95a63530ab9e28f5b2bd8962ff7bb07fff7c762eee0cc55ceb0cbd13af700')
sha256sums_i686=('4967a749c505f7b27e8200290b805785ef97aa34c6ea262ea3e55324c1dfc545')
sha256sums_x86_64=('bfd1635417a6123ebcc5d747da0fd7007054827cdeb24dff55fcff1ca68373aa')
prepare() {
    sed -i "s/\/usr\/local\/bin\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/local/bin/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(8x8 16x16 22x22 24x24 32x32 36x36 42x42 48x48 64x64 72x72 128x128 160x160 192x192 256x256 384x384 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
