# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=adbmanager-bin
_pkgname=adbmanager
pkgver=3.1
pkgrel=1
pkgdesc="The program is designed for visual and easy management of the ADB-Server and connection of Android smartphones. "
arch=('x86_64')
url="https://github.com/AKotov-dev/adbmanager"
license=('GPL3')
options=()
conflicts=()
depends=(gtk2 at-spi2-core)
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-0.mrx8_amd64.deb")
sha512sums=('c3dbd4dac2cdfac9a6f6082b9395968f101bfbad3e881b0ff14f45d00558e08b00528964dad09c1ff68f53b01dfcbf9f4ca517958c12b3946b2ccb7c9e7e60f1')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    chown -R root:root "${pkgdir}/"
    find "${pkgdir}/usr" -type d -exec chmod 755 {} \;
    mkdir -p "${pkgdir}/opt"
    rm -r "${pkgdir}/usr/bin"
    mv "${pkgdir}/usr/share/${_pkgname}" "${pkgdir}/opt/${_pkgname}"
    sed 's/Exec=adbmanager/Exec=\/opt\/adbmanager\/adbmanager/g' -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
