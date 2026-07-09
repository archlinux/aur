# Maintainer: komorebi <932556591@qq.com> 
pkgname=cloudmusicplayer
_pkgname=CloudMusicPlayer
pkgver=1.0.3
pkgrel=1
pkgdesc="A Linux music player for NetEase Cloud Music, based on Rust + GTK4"
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
