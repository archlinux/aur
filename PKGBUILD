# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=frame
pkgname="${_pkgname}-eth-bin"
_appname=Frame
pkgver=0.6.8
pkgrel=1
pkgdesc="System-wide Web3"
arch=("aarch64" "x86_64")
url="https://frame.sh/"
_ghurl="https://github.com/floating/frame"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-dev" "${pkgname%-bin}-canary")
depends=('bash' 'electron23')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('cf35f64affa2c15af5171d01f2ae63e124cc19264eca3f300268de95f079f564')
sha256sums_aarch64=('92dd36a4a68992985293aa796573877c33d8e4d1e036d2b2de167622aece374b')
sha256sums_x86_64=('356f81057f557f5f2ff945c1c215265933930484033525fe1c63a2fa511f41e2')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|/opt/${_appname}/${_pkgname} %U|${pkgname%-bin}|g" \
        -e "s|Icon=${_pkgname}|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}