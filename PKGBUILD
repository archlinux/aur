# Maintainer: archbluxe  <archblux@126.com>

pkgname=zyplayer-appimage
pkgver=3.2.0
_pkgver=$(echo $pkgver | sed 's/\./-/3')
pkgrel=1
pkgdesc="跨平台桌面端视频资源播放器,免费高颜值"
arch=("x86_64" "arm64")
url="https://github.com/Hiram-Wong/ZyPlayer"
license=('MIT')
depends=('electron')
provides=('ZyPlayer')
options=(!strip)
source=("https://github.com/Hiram-Wong/ZyPlayer/releases/download/v${_pkgver}/ZYPlayer-linux-${_pkgver}-${arch}.AppImage"
        'ZyPlayer'
        'ZyPlayer.desktop')
md5sums=('403792098e58af6b3fc575a4c12b5b3b'
         'a0075fe2ae27fad2ca6cfff1e1e10620'
         'ce47af03c780c02b086c9b8f576c3419')
_filename=ZYPlayer-linux-${_pkgver}-${arch}.AppImage

prepare() {
    chmod +x ${_filename}
    ./${_filename} --appimage-extract &> /dev/null
}

package() {
    install -Dm755 "${srcdir}/ZYPlayer-linux-${_pkgver}-${arch}.AppImage" "${pkgdir}/opt/ZyPlayer/ZyPlayer.AppImage"
    install -Dm755 "ZyPlayer" "${pkgdir}/usr/bin/ZyPlayer"
    install -Dm644 "ZyPlayer.desktop" "${pkgdir}/usr/share/applications/ZyPlayer.desktop"
    install -Dm644 "squashfs-root/zy-player.png" "${pkgdir}/usr/share/icons/ZyPlayer.png"
    }
