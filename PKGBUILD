# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=paster-bin
_pkgname=paster
pkgver=1.0.0
pkgrel=1
pkgdesc="A clipboard management tool implemented with Electron + React + ArcoDesign.It well be a handy paste tool"
arch=("x86_64")
url="https://github.com/zengxiaolou/paste"
license=('GPL')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'mesa'
    'libxrandr'
    'nss'
    'pango'
    'alsa-lib'
    'libx11'
    'cairo'
    'libxcb'
    'gtk3'
    'at-spi2-core'
    'libxcomposite'
    'nspr'
    'libcups'
    'java-runtime'
    'libxfixes'
    'libxext'
    'libdrm'
    'libxdamage'
    'expat'
    'libxkbcommon'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('051afe059a8eb439c7c8250eda48e5c485ed49abd7d82d7f65f6a4148de25309')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/bin"
    cp -r "${srcdir}/opt" "${pkgdir}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" "${pkgdir}/usr/share/pixmaps"
}
