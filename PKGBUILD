# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=oneanime-appimage
pkgdesc="一款简洁清爽无广告的看番软件。一款带弹幕的 anime1 第三方客户端，界面符合 Material You 规范。"
pkgver=1.4.1
pkgrel=1
_pkgname=oneAnime_linux_${pkgver}.AppImage
arch=("x86_64")
url="https://github.com/Predidit/oneAnime"
license=("GPL3")
options=('!strip')
source=("https://github.com/Predidit/oneAnime/releases/download/${pkgver}/${_pkgname}")
sha256sums=('SKIP')

_icon_path=/usr/share/icons/hicolor/160x160/apps

prepare() {
    cd ${srcdir}
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract > /dev/null
    sed -i "s|^Exec=.*|Exec=/opt/appimages/oneAnime.AppImage --no-sandbox|" "squashfs-root/oneAnime.desktop"
    sed -i "s|^Icon=.*|Icon=${_icon_path}/icon.png|" "squashfs-root/oneAnime.desktop"
    find "squashfs-root/${_icon_path}/icon.png" -type d -exec chmod 755 {} \;
}

package() {
    install -Dm755 ${_pkgname} "${pkgdir}/opt/appimages/oneAnime.AppImage"
    install -Dm644 "squashfs-root/oneAnime.desktop" "${pkgdir}/usr/share/applications/oneAnime.desktop"
    install -dm755 "${pkgdir}/${_icon_path}"
    cp "squashfs-root/${_icon_path}/icon.png" "${pkgdir}/${_icon_path}/icon.png"
}
