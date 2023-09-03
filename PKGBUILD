# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=librefancontrol-bin
_pkgname=LibreFanControl
pkgver=1.0.4
pkgrel=1
pkgdesc="A way to control fans based on temperature"
arch=("x86_64")
url="https://github.com/wiiznokes/LibreFanControl"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'freetype2' 'libxi' 'gcc-libs' 'libx11' 'libxrender' 'alsa-lib' 'zlib' 'libxtst' 'bash' 'libglvnd' 'fontconfig' 'java-runtime' 'libxext' 'i2c-tools' 'aspnet-runtime')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}.tar.gz")
sha256sums=('8c81e811158d9ca6ee869eef813486987bc30b799d24b953916e5d472841a19a')
prepare() {
    gendesk -f -n --categories "System;Utility" --name "${_pkgname}" --exec "${pkgname}"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,etc/systemd/system,usr/bin,usr/local/bin/"${_pkgname}"Service}
    cp -r "${srcdir}/${_pkgname}" "${pkgdir}/opt"
    ln -sf "/opt/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}