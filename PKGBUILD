# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=codemao-kitten3-bin
_pkgname=cn.codemao.kitten3
pkgver=3.7.14
pkgrel=1
epoch=
pkgdesc="编程猫源码编辑器"
arch=('x86_64')
license=('unknown')
url="https://codemao.cn"
_deepinurl="https://com-store-packages.uniontech.com/pool/appstore"
provides=()
depends=(at-spi2-core nss alsa-lib gtk3)
optdepends=()
source=(
    "${pkgname}-${pkgver}.deb::${_deepinurl}/c/${_pkgname}/${_pkgname}_${pkgver}_amd64.deb"
)
sha256sums=('891b51c993f266b2e37514ea1e586308187ea23c24e81b3ce895edfcdb2fc30e')
package(){
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/apps/${_pkgname}" "${pkgdir}/opt/apps/${pkgname}"
    sed 's/Icon=/#Icon=/g' -i "${pkgdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
    sed 's/cn.codemao.kitten3/codemao-kitten3-bin/g' -i "${pkgdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
    echo "Icon=${pkgname}" >> "${pkgdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    for i in 32x32 64x64 128x128 256x256 512x512;do
        install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/${i}/apps/Kitten3.png" "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${pkgname}.png"
    done
    rm -r "${pkgdir}/opt/apps/codemao-kitten3-bin/info"
}
