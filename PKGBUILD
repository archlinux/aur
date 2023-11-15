# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shedshield-bin
pkgver=0.0.3_beta
pkgrel=1
pkgdesc="A cross-platform application that shuts down your desktop PC before loadshedding"
arch=('x86_64')
url="https://github.com/ZJouba/ShedShield"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'nss'
    'libxdamage'
    'expat'
    'libx11'
    'libxkbcommon'
    'libxrandr'
    'nspr'
    'libdrm'
    'cairo'
    'libxcomposite'
    'at-spi2-core'
    'mesa'
    'gtk3'
    'dbus'
    'pango'
    'libxcb'
    'libcups'
    'libxext'
    'libxfixes'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/.}_amd64.deb"
)
sha256sums=('7ad50254295afd4283a42b1805eb7be96fe7f02f64085dd43c31cd823b6bd388')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
}
package() {
    install -Dm755 -d "${pkgdir}"/{usr/bin,opt}
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}