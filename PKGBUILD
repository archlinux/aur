# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fcitx-huayupinyin
_appname="com.thunisoft.input"
pkgver=2.4.8.206
pkgrel=1
pkgdesc="The Input Method Developed by thunisoft"
arch=('x86_64')
url="https://pinyin.thunisoft.com"
license=(LGPL3)
conflicts=()
providers=(thunisoft)
depends=('libxtst' 'qt5-svg' 'qt5-base' 'fcitx' 'fcitx-qt5' 'fcitx-configtool' 'glibc' 'cairo' 'libx11' 'gcc-libs' 'sh' 'dbus')
options=()
source=("${pkgname}-${pkgver}.deb::${url}/webapi/v1/downloadSetupFile?os=uos&cpu=x86")
sha256sums=('36e3a2f513b8f3827f79ea2ec0df27cfe5711e156fce3cfdfe37b9cfd65fa705')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/usr/lib/x86_64-linux-gnu/fcitx" "${pkgdir}/usr/lib/"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    echo -e "Icon=fcitx-huayupy \nCategories=System;Utility; \nStartupNotify=false \nNoDisplay=true" >> "${pkgdir}/opt/apps/${_appname}/entries/autostart/${_appname}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/entries/autostart/${_appname}.desktop" "${pkgdir}/etc/xdg/autostart/${pkgname}.desktop"
    rm -rf "${pkgdir}/usr/share/fcitx/imicon" "${pkgdir}/opt/apps/${_appname}/info" "${pkgdir}/usr/lib/x86_64-linux-gnu"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/files/lgpl-3.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}