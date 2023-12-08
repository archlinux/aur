# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=librefancontrol-bin
_pkgname=LibreFanControl
pkgver=1.0.5
pkgrel=3
pkgdesc="A way to control fans based on temperature"
arch=("x86_64")
url="https://github.com/wiiznokes/LibreFanControl"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'freetype2'
    'libxi'
    'libx11'
    'libxrender'
    'alsa-lib'
    'libxtst'
    'libglvnd'
    'fontconfig'
    'java-runtime'
    'libxext'
    'i2c-tools'
    'aspnet-runtime'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}.tar.gz"
)
sha256sums=('23704f323b17d0f8d791667edc6fa4cf3807681fd44250deb5a2b1f768b98fc7')
build() {
    gendesk -q -f -n --categories "System;Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,etc/systemd/system,usr/bin,usr/local/bin/"${_pkgname}"Service}
    cp -r "${srcdir}/${_pkgname}" "${pkgdir}/opt"
    ln -sf "/opt/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}