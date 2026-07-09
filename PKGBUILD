# Maintainer: komorebi <932556591@qq.com> 
pkgname=cloudmusicplayer
_pkgname=CloudMusicPlayer
pkgver=1.0.3
pkgrel=1
pkgdesc="CloudMusicPlayer 是面向网易云音乐的 Linux 音乐播放器，
基于 netease-cloud-music-gtk 进行界面UI、交互、视觉及动画效果设计重构，
评论区开放、互动等新功能，并包含播放队列、歌词页和列表性能优化等改动,体验更完善丝滑"
arch=('x86_64')
url="https://github.com/b1ngggg/CloudMusicPlayer"
license=('GPL-3.0-or-later')
depends=(
    'gtk4'
    'libadwaita'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-plugins-bad'
    'gst-libav'
    'json-glib'
    'libsoup3'
    'curl'                    
)
makedepends=(
    'cargo'
    'meson'
    'curl'                    
)
source=(
	    "https://github.com/b1ngggg/CloudMusicPlayer/archive/v$pkgver.tar.gz"
)
sha256sums=('cf69f8ea4e63ade127c8bc9676911de5a5d345e9aa9c72c55f829859b6be5c72') 
options=(!debug)
prepare() {
    cd "$_pkgname-$pkgver"
}

build() {
    CFLAGS+=" -ffat-lto-objects"
    arch-meson --buildtype release "$_pkgname-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
