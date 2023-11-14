# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=alphabiz-bin
_pkgname=Alphabiz
pkgver=0.3.1
pkgrel=4
pkgdesc="Web3 ecosystem - enable developers to build fully decentralized media platform and blockchain-based marketplace"
arch=('x86_64')
url="https://alpha.biz/"
_ghurl="https://github.com/tanshuai/alphabiz"
license=('GPL2')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'expat'
    'cairo'
    'wayland'
    'pango'
    'java-runtime'
    'libxfixes'
    'mesa'
    'libx11'
    'libxkbcommon'
    'libxcb'
    'gtk3'
    'libxrandr'
    'nss'
    'libdrm'
    'libxext'
    'at-spi2-core'
    'libcups'
    'libxdamage'
    'nspr'
    'alsa-lib'
    'libxcomposite'
)
source=("${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.deb")
sha256sums=('e3731b4d2ec237d39c7811aead372d431632b8dbe2ac5382884521fcf84f82f9')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|--|--no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}