# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=certmanager-uos
_pkgname=certmanager
_uosname=cn.bitnum.certmanager
pkgver=1.0.0
pkgrel=1
pkgdesc="一款简单高效的本地证书管理工具,提供证书安装、证书管理、证书验证等功能，支持国密证书."
arch=('x86_64')
url="http://www.bitnum.com/"
license=('unknow')
depends=(qt6-base hicolor-icon-theme)
options=()
source=(
  "${_pkgname}-${pkgver}.deb::https://com-store-packages.uniontech.com/pool/appstore/c/${_uosname}/${_uosname}_${pkgver}_amd64.deb"
)
sha512sums=('e0fcd0dc498b50ea10f56fe08bd39634f3294ad45a237cd949176394169de5c52b2e85942b8540feb589f4a0a0f1e39f2a485367d515a47241d73e5d03925b3d')
    
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/apps/${_uosname}" "${pkgdir}/opt/apps/${pkgname}"
    rm -r "${pkgdir}/opt/apps/${pkgname}/info"
    sed 's/cn.bitnum.certmanager/certmanager-uos/g;s/Icon/#Icon/g' \
        -i "${pkgdir}/opt/apps/${pkgname}/entries/applications/${_uosname}.desktop"
    echo "Icon=${_pkgname}" >> "${pkgdir}/opt/apps/${pkgname}/entries/applications/${_uosname}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/applications/${_uosname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
}