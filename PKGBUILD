# Maintainer: orlfman
pkgname=ffmpeg-converter-gtk
_pkgname=FFmpeg-Converter-GTK
pkgver=1.5.9
pkgrel=1
pkgdesc="Modern GTK4 + libadwaita frontend for FFmpeg (SVT-AV1, x265, x264, VP9)"
arch=('x86_64')
url="https://github.com/orlfman/FFmpeg-Converter-GTK"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'json-glib' 'glib2' 'libsoup3' 'ffmpeg'
         'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-libav')
makedepends=('meson' 'vala')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('31f19b14a0a2cb32021ae7d713635d4b3c39b3b3cc53a6b477220b83a6ba01f7')

build() {
    arch-meson "$_pkgname-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm644 "$_pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
