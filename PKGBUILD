# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dostron-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A cross-platform application to organise your collection of old programs for DOSBox."
arch=('x86_64')
url="https://github.com/he-yaowen/dostron"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('glib2' 'at-spi2-core' 'gtk3' 'libdrm' 'cairo' 'libxcomposite' 'glibc' 'libxext' 'expat' 'pango' 'nss' 'libxfixes' 'nspr' \
    'libcups' 'gcc-libs' 'libxrandr' 'libxkbcommon' 'libx11' 'mesa' 'libxdamage' 'dbus' 'libxcb' 'alsa-lib')
makedepends=('gendesk')
options=()
noextract=("${pkgname%-bin}-${pkgver}.tar.xz")
source=("${pkgname%-bin}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-${CARCH}.tar.xz"
    "${pkgname%-bin}.png::${url}/raw/main/resources/icons/app.png")
sha256sums=('031331a6e5406907b0044c874279abd40045d42bc9ff2880850839c7b26ff204'
            '5d4ddf7ce957356bf21e85c5884e8939aa5d6fba5a34da9398e318d9a7a80176')
package() {
    install -Dm755 -d "${pkgdir}/opt"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.tar.xz" -C "${pkgdir}/opt"
    mv "${pkgdir}/opt/${pkgname%-bin}-${pkgver}" "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Game" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}