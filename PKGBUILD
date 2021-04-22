# Maintainer: ventusliberum <dafeinayius@gmail.com>

pkgname=zy-player-appimage
_pkgname=zy-player
pkgver=2.8.3
_pkgver=$(echo $pkgver | sed 's/\./-/3')
pkgrel=1
pkgdesc="跨平台视频资源播放器, 简洁免费无广告"
arch=("x86_64")
url="http://zyplayer.fun/"
license=('MIT')
provides=('zy-player')
options=(!strip)
source=("https://github.com/Hunlongyu/ZY-Player/releases/download/v${_pkgver}/ZY-Player-${_pkgver}.AppImage"
        'zy-player.sh')
sha256sums=('fc6b6d5fd6592cb2d91f2409f14fcd3710acaf300ee623a86e2be53033d1c5bb'
            '3626ced8de95c110129ed9dff1f8ea34243b2430b0b91c737dd7d166658bc1f2')
_filename=ZY-Player-${_pkgver}.AppImage

prepare() {
    cd "${srcdir}"
    chmod +x ${_filename}
    ./${_filename} --appimage-extract
    sed -i "s|^Exec=AppRun|Exec=/usr/bin/${_pkgname} %U|g;\
            s|^Icon=zy|Icon=zy-player|g;\
            s|^StartupWMClass=ZY Player|StartupWMClass=zy|g;\
            s|^Categories=Development;|Categories=AudioVideo;Player;|g" "squashfs-root/zy.desktop"
}

package() {
    install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/squashfs-root/zy.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/zy.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
} 

