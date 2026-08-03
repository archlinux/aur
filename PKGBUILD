# Maintainer: komorebi <932556591@qq.com>
# Contributor: b1ngggg <b1ngggg@users.noreply.github.com>
pkgname=cloudmusicplayer
pkgver=1.0.4
pkgrel=1
pkgdesc="CloudMusicPlayer 是面向网易云音乐的 Linux 音乐播放器，
基于 netease-cloud-music-gtk 进行界面UI、交互、视觉及动画效果设计重构，
评论区开放、互动等新功能，并包含播放队列、歌词页和列表性能优化等改动,体验更完善丝滑"
arch=('x86_64')
url="https://github.com/b1ngggg/CloudMusicPlayer"
license=('GPL3')
depends=(
    'desktop-file-utils'
    'gst-libav'
    'gst-plugins-bad'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-plugins-ugly'
    'hicolor-icon-theme'
    'libadwaita'
    'gdk-pixbuf2'
    'glib2'               # 提供 GSettings 触发器
    'graphene'
    'gstreamer'
    'gtk4'
    'pango'
    'openssl'
    'zlib'
)
options=(!debug)
makedepends=()
source=("cloudmusicplayer_${pkgver}-1_amd64.deb::https://github.com/b1ngggg/CloudMusicPlayer/releases/download/v${pkgver}/cloudmusicplayer_${pkgver}-1_amd64.deb")
sha256sums=('2a4cd18e1257ac66ebc505fcc0eb234c3e523e5e9f9ed73ec1102ff4a258f4b5') 

package() {
    cd "$srcdir"
    # 解压 deb 包
    ar x "cloudmusicplayer_${pkgver}-1_amd64.deb"
    # 这里使用自动识别（支持 .tar.*）
    tar -xf data.tar.* -C "$pkgdir"
    # 注意：GSettings schema 和图标缓存由 pacman 触发器自动处理，
    # 无需额外命令。若需要手动编译 schema，可取消下行注释：
    # glib-compile-schemas --strict "$pkgdir/usr/share/glib-2.0/schemas"
}
