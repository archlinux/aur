# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=arctis-monitor-bin
pkgver=0.0.11
pkgrel=1
pkgdesc="Electron Tray application to view Battery Level of Arctis Headsets"
arch=("x86_64")
url="https://github.com/richrace/arctis-monitor"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/richrace/arctis-monitor/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('bb9b2931ea64e7c5596f03de978175a646929f75120e4d351b52f9ac23e3e9a5'
            'bd5c70f61f5c60d42bffbadd12de9a6e0f3272afe8d869e7251d4f0c6d67025d'
            '420ec88565ec14742ae65566907ad07cadaf99a4a1e8881c88ee3f3a6b07ae74')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}