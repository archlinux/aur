# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xnview-xnsketch-bin
_pkgname=XnSketch
pkgver=1.20
pkgrel=1
pkgdesc="Allows you to turn your photos into cartoon or sketch images."
arch=('x86_64')
url="https://www.xnview.com/en/xnsketch/"
license=('unknown')
conflicts=()
depends=(gtk2 qt5-sensors at-spi2-core)
options=()
source=(
  "${_pkgname}-${pkgver}.tgz::https://download.xnview.com/XnSketch-linux-x64.tgz"
)
sha512sums=('56365b3977241a60f6b592c3dc41bb6e2d829aabc3061aaad10a660b9b070d33035f387c57ebfa8630ee796d80bcdef23b231608689821f0107eb9fa5ace62f7')
   
package() {
    mkdir -p "${pkgdir}/opt/"
    bsdtar -xvf ${_pkgname}-${pkgver}.tgz -C "${pkgdir}/opt/"
    chmod 644 "${pkgdir}/opt/${_pkgname}/xnsketch.png"
    sed 's/Exec=/#Exec=/g;s/Icon=/#Icon=/g' -i "${pkgdir}/opt/${_pkgname}/${_pkgname}.desktop"
    echo "Exec=/opt/${_pkgname}/${_pkgname}" >> "${pkgdir}/opt/${_pkgname}/${_pkgname}.desktop"
    echo "Icon=xnsketch" >> "${pkgdir}/opt/${_pkgname}/${_pkgname}.desktop"
    chown -R root:root  "${pkgdir}/opt/${_pkgname}"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/xnsketch.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/xnsketch.png"
}