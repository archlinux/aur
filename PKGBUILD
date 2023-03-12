# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=srware-iron-bin
_pkgname=iron
pkgver=110.5600.0
pkgrel=1
epoch=
pkgdesc="SRWare Iron Browser is a light-weight browser,based on Chromium"
arch=("x86_64")
url="https://www.srware.net/"
license=('custom:freeware')
depends=('gtk2' 'alsa-lib' 'qt5-base' 'nss' 'at-spi2-core')
optdepends=()
conflicts=()
provides=("SRWare")
install=
source=(
    "${_pkgname}_${pkgver}_amd64.deb::${url}/downloads/${_pkgname}64.deb"
    "LICENSE::https://www.srware.net/license.txt"
    "${pkgname}.desktop"
    )
md5sums=('155e21af68e45c78b3f203005b332a1e'
         '7e5c8bc3986be55cd2d4649361287a22'
         '7415fbccd4a3539dfdb2f410264d7871')
  
prepare() {
    bsdtar -xf data.tar.xz
    mkdir -p "${srcdir}/opt"
    mv "${srcdir}/usr/share/${_pkgname}" "${srcdir}/opt/${pkgname}"
    chmod +x "${srcdir}/opt/${pkgname}/chrome-wrapper"
    chmod 755 "${srcdir}/opt/${pkgname}/extensions"
}

package() {
    cp -r "${srcdir}/opt/" "${pkgdir}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/iron_product_logo.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
