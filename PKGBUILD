# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=serialportassistant-bin
_pkgname=SerialPortAssistant
pkgver=0.5.16
pkgrel=1
pkgdesc="A cross-platform serial port assistant. It can run on WINDOWS, linux、android、macos system.一个跨平台的串口助手"
arch=("x86_64")
url="https://github.com/KangLin/SerialPortAssistant"
license=('GPL3')
depends=('bash' 'glibc' 'qt5-webengine' 'qt5-base' 'gcc-libs' 'openssl')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('6e181536039614a311d2ce1042de45ba4f99992e668dc62261e8dd7fdf0c387f')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|/opt/${_pkgname}/bin/${_pkgname}.sh|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/opt/${_pkgname}/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/bin/${_pkgname}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}