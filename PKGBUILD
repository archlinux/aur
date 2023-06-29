# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=lx-music-desktop-appimage
pkgver=2.3.0
pkgrel=1
pkgdesc="一个基于electron的音乐软件"
arch=("x86_64")
url="https://github.com/lyswhut/lx-music-desktop"
license=("Apache")
_pkgname="lx-music-desktop-v${pkgver}-x64.AppImage"
noextract=(${_pkgname})
options=("!strip")
depends=('fuse2')
source=("${_pkgname}::https://github.com/lyswhut/lx-music-desktop/releases/download/v${pkgver}/${_pkgname}")
sha512sums=("6755911473afb9271d6705ea3bd64e09362cf1e23b398ec760a9685aec4c1dedecfe9be2887b8a23fd23272123bff8ed62ad69c69ab45739b4ddd838dc533937")

_installdir=/opt/appimages

prepare() {
    chmod a+x ../${_pkgname}
    ./${_pkgname} --appimage-extract >/dev/null
    _desktop_file="squashfs-root/lx-music-desktop.desktop"
    sed -i "s+Name=lx-music-desktop+Name=LX Music+" ${_desktop_file}
    sed -i "s+AppRun+env DESKTOPINTEGRATION=no ${_installdir}/lx-music-desktop.AppImage+" ${_desktop_file}
    sed -i "s+^Icon=.*+Icon=lx-music-desktop-appimage+" ${_desktop_file}
    sed -i "/^Comment=/d" ${_desktop_file}
    sed -i "/^Name[zh_CN]=/d" ${_desktop_file}
    sed -i "3iName[zh_CN]=洛雪音乐助手" ${_desktop_file}
    sed -i "4iComment[zh_CN]=一个免费的音乐查找助手" ${_desktop_file}
    sed -i "4iComment=A free music search helper" ${_desktop_file}
}

package() {
    install -Dm755 ../${_pkgname} "${pkgdir}/${_installdir}/lx-music-desktop.AppImage"
    install -Dm644 "squashfs-root/lx-music-desktop.desktop" "${pkgdir}/usr/share/applications/lx-music-desktop-appimage.desktop"

    install -Dm644 "squashfs-root/usr/share/icons/hicolor/16x16/apps/lx-music-desktop.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/lx-music-desktop-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/32x32/apps/lx-music-desktop.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/lx-music-desktop-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/48x48/apps/lx-music-desktop.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/lx-music-desktop-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/64x64/apps/lx-music-desktop.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/lx-music-desktop-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/128x128/apps/lx-music-desktop.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/lx-music-desktop-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/256x256/apps/lx-music-desktop.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/lx-music-desktop-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/lx-music-desktop.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/lx-music-desktop-appimage.png"
}
