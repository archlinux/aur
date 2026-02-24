# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=amphitheatre-desktop-bin
pkgver=0.11.1
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
sha256sums_aarch64=('e466343068659447cb61f874c52d26acfcc41e7686f3b7c024c85a107ac015c7')
sha256sums_i686=('196348eebddcdce90b2f8417042674cc0e4e83c286143e41e0b50d9a74858050')
sha256sums_x86_64=('62d647e3cf3b0665015c6e28f6a22aa44ab699e4cd5518b92e6ecb8525dc9b22')
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
