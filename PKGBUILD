# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fcitx-huayupinyin
_appname=com.thunisoft.input
pkgver=2.4.8.207
pkgrel=2
pkgdesc="The Input Method Developed by thunisoft"
arch=("x86_64")
url="https://pinyin.thunisoft.com"
license=("LGPL3")
conflicts=()
providers=(thunisoft)
depends=('libxtst' 'qt5-svg' 'qt5-base' 'fcitx' 'fcitx-qt5' 'fcitx-configtool' 'glibc' 'cairo' 'libx11' 'gcc-libs' 'sh' 'dbus')
options=("!strip")
source=("${pkgname}-${pkgver}.deb::${url}/webapi/v1/downloadSetupFile?os=uos&cpu=x86")
sha256sums=('ec965e51f30ddf548d4ab2ba0324bc0e8c6691b39f33112a872eecbb6bf5fa5c')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/apps/${_appname}/files/bin/huayupy-config-tools-fcitx" "${pkgdir}/usr/bin/huayupy-config-tools-fcitx"
    ln -sf "/opt/apps/${_appname}/files/bin/huayupy-daemon-fcitx" "${pkgdir}/usr/bin/huayupy-daemon-fcitx"
    ln -sf "/opt/apps/${_appname}/files/bin/huayupy-merge-wordlib" "${pkgdir}/usr/bin/huayupy-merge-wordlib"
    ln -sf "/opt/apps/${_appname}/files/bin/huayupy-qimpanel" "${pkgdir}/usr/bin/huayupy-qimpanel"
    ln -sf "/opt/apps/${_appname}/files/bin/huayupy-toolBox" "${pkgdir}/usr/bin/huayupy-toolBox"
    ln -sf "/opt/apps/${_appname}/files/bin/huayupy-updater-fcitx" "${pkgdir}/usr/bin/huayupy-updater-fcitx"
    ln -sf "/opt/apps/${_appname}/files/bin/huayupy-wl-tool-fcitx" "${pkgdir}/usr/bin/huayupy-wl-tool-fcitx"
    ln -sf "/opt/apps/${_appname}/files/bin/special-symbols-fcitx" "${pkgdir}/usr/bin/special-symbols-fcitx"
    mv "${pkgdir}/usr/lib/x86_64-linux-gnu/fcitx" "${pkgdir}/usr/lib/"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/entries/autostart/${_appname}.desktop" "${pkgdir}/etc/xdg/autostart/${pkgname}.desktop"
    #Delete empty dirs
    rm -rf "${pkgdir}/usr/share/fcitx/imicon" "${pkgdir}/opt/apps/${_appname}/info" "${pkgdir}/usr/lib/x86_64-linux-gnu"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/files/lgpl-3.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}