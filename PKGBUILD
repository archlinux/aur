# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fcitx-huayupinyin
_pkgname=com.thunisoft.input
_appname=huayupy
pkgver=2.4.8.207
pkgrel=5
pkgdesc="The Input Method Developed by thunisoft"
arch=("x86_64")
url="https://pinyin.thunisoft.com"
license=("LGPL-3.0")
conflicts=()
depends=(
    'qt5-svg'
    'qt5-base'
    'fcitx'
    'fcitx-qt5'
    'fcitx-configtool'
)
options=("!strip")
source=(
    "${pkgname}-${pkgver}.deb::${url}/webapi/v1/downloadSetupFile?os=uos&cpu=x86"
)
sha256sums=('ec965e51f30ddf548d4ab2ba0324bc0e8c6691b39f33112a872eecbb6bf5fa5c')
package() {
    bsdtar -xf "${srcdir}/data."* -C "${pkgdir}"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    mv "${pkgdir}/usr/lib/x86_64-linux-gnu/fcitx" "${pkgdir}/usr/lib/"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/apps/${_pkgname}/files/bin/${_appname}-config-tools-fcitx" "${pkgdir}/usr/bin/${_appname}-config-tools-fcitx"
    ln -sf "/opt/apps/${_pkgname}/files/bin/${_appname}-daemon-fcitx" "${pkgdir}/usr/bin/${_appname}-daemon-fcitx"
    ln -sf "/opt/apps/${_pkgname}/files/bin/${_appname}-merge-wordlib" "${pkgdir}/usr/bin/${_appname}-merge-wordlib"
    ln -sf "/opt/apps/${_pkgname}/files/bin/${_appname}-qimpanel" "${pkgdir}/usr/bin/${_appname}-qimpanel"
    ln -sf "/opt/apps/${_pkgname}/files/bin/${_appname}-toolBox" "${pkgdir}/usr/bin/${_appname}-toolBox"
    ln -sf "/opt/apps/${_pkgname}/files/bin/${_appname}-updater-fcitx" "${pkgdir}/usr/bin/${_appname}-updater-fcitx"
    ln -sf "/opt/apps/${_pkgname}/files/bin/${_appname}-wl-tool-fcitx" "${pkgdir}/usr/bin/${_appname}-wl-tool-fcitx"
    ln -sf "/opt/apps/${_pkgname}/files/bin/special-symbols-fcitx" "${pkgdir}/usr/bin/special-symbols-fcitx"
    install -Dm644 "${pkgdir}/opt/apps/${_pkgname}/entries/autostart/${_pkgname}.desktop" "${pkgdir}/etc/xdg/autostart/${pkgname}.desktop"
    #Delete empty dirs
    rm -rf "${pkgdir}/usr/share/fcitx/imicon" "${pkgdir}/opt/apps/${_pkgname}/info" "${pkgdir}/usr/lib/x86_64-linux-gnu"
    install -Dm644 "${pkgdir}/opt/apps/${_pkgname}/files/lgpl-3.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}