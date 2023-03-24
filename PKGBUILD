# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fcitx-huayupinyin
_deepinname="com.thunisoft.input"
pkgver=2.4.8.198
pkgrel=3
pkgdesc="The Input Method Developed by thunisoft"
arch=('x86_64')
url="https://pinyin.thunisoft.com"
license=(custom)
conflicts=()
providers=(thunisoft)
depends=(libxtst qt5-svg qt5-base fcitx fcitx-qt5 fcitx-configtool glibc cairo libx11 gcc-libs sh dbus)
options=()
source=("${pkgname}-${pkgver}.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/c/${_deepinname}/${_deepinname}_${pkgver}_amd64.deb")
sha256sums=('286e5afd96c15dc3c3691061d77aabae0f02abe4031d7a483a6e537a0ebb719f')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/usr/lib/x86_64-linux-gnu/fcitx" "${pkgdir}/usr/lib/"
    rmdir "${pkgdir}/usr/lib/x86_64-linux-gnu"
    rm -r "${pkgdir}/opt/apps/${_deepinname}/info"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    echo -e "Icon=fcitx-huayupy \nCategories=System;Utility; \nStartupNotify=false \nNoDisplay=true" >> "${pkgdir}/opt/apps/${_deepinname}/entries/autostart/${_deepinname}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${_deepinname}/entries/autostart/${_deepinname}.desktop" "${pkgdir}/etc/xdg/autostart/${pkgname}.desktop"
}