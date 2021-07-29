# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=zy-player-appimage
pkgver=2.8.5
_pkgver=$(echo $pkgver | sed 's/\./-/3')
pkgrel=1
pkgdesc="跨平台视频资源播放器, 简洁免费无广告"
arch=("x86_64")
url="http://zyplayer.fun/"
license=('MIT')
depends=('electron11')
provides=('zy-player')
options=(!strip)
source=("https://github.com/Hunlongyu/ZY-Player/releases/download/v${_pkgver}/ZY-Player-${_pkgver}.AppImage"
        'zy-player'
        'zy-player.desktop')
md5sums=('SKIP'
        '00d32292a0f02465b83182ebe35a1f3f'
        '8490019ad48ac40a5cde99ae5ba6baff')
_filename=ZY-Player-${_pkgver}.AppImage

prepare() {
    chmod +x ${_filename}
    ./${_filename} --appimage-extract &> /dev/null
}

package() {
    install -Dm755 "zy-player" "${pkgdir}/usr/bin/zy-player"
    install -Dm644 "zy-player.desktop" "${pkgdir}/usr/share/applications/zy-player.desktop"
    install -Dm644 "squashfs-root/zy.png" "${pkgdir}/usr/share/icons/zy-player.png"
    install -Dm644 "squashfs-root/resources/app.asar" "${pkgdir}/usr/share/zy-player/zy-player.asar"
}
