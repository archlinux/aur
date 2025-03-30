# Maintainer: Marie Piontek <marie@kaifa.ch>
# Maintainer: Hajos Attila <linux.alucard@gmail.com>

pkgname=tidal-hifi-bin
pkgver=5.18.1
pkgrel=1
pkgdesc="The web version of Tidal running in electron with hifi support thanks to widevine."
arch=(x86_64)
url="https://github.com/Mastermindzh/tidal-hifi"
license=("custom:MIT")
depends=(libxss nss gtk3)
conflicts=("tidal-hifi")
provides=("tidal-hifi")
source=("tidal-hifi-${pkgver}.tar.gz::https://github.com/Mastermindzh/tidal-hifi/releases/download/${pkgver}/tidal-hifi-${pkgver}.tar.gz"
        "tidal-hifi.desktop"
        "icon.png")
md5sums=('b877b291527b49d4c1404b65f08021b0'
         '88191ae3a540dff6dd84175c0f86dd86'
         '1caae79ff90e803a2728f581ef40cca4')

package() {
    cd "tidal-hifi-${pkgver}"
    install -d "${pkgdir}/opt/tidal-hifi/" "${pkgdir}/usr/bin"
    cp -r * "${pkgdir}/opt/tidal-hifi/"
    chmod +x "${pkgdir}/opt/tidal-hifi/tidal-hifi"
    ln -s "/opt/tidal-hifi/tidal-hifi" "${pkgdir}/usr/bin/tidal-hifi"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/tidal-hifi.png"
    install -Dm644 "${srcdir}/tidal-hifi.desktop" -t "${pkgdir}/usr/share/applications"
}
