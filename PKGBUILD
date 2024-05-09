# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=amphitheatre-desktop-bin
pkgver=0.7.2
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
sha256sums_aarch64=('a0cd15f3dc8d85a31d8978e487d36d639b368a6109854da0b86276a15b0dad9a')
sha256sums_i686=('6071f9f0595de4f542cbe04f40047e0a8c64630b8e3ce85656e80517c42b5216')
sha256sums_x86_64=('161a6aa3bd0596b07d2e0a497696c5be56118e133b60cfceff47a7e7beccb29a')
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