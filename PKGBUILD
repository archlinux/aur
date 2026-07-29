# Maintainer: orlfman
pkgname=ffmpeg-converter-gtk
_pkgname=FFmpeg-Converter-GTK
pkgver=1.6.2
pkgrel=1
pkgdesc="Modern GTK4 + libadwaita frontend for FFmpeg (SVT-AV1, x265, x264, VP9)"
arch=('x86_64')
url="https://github.com/orlfman/FFmpeg-Converter-GTK"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'json-glib' 'glib2' 'libsoup3'
         'cairo' 'pango' 'glibc' 'hicolor-icon-theme'
         'ffmpeg' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good'
         'gst-plugins-bad' 'gst-libav')
makedepends=('meson' 'vala')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7deb7143028f60e077918c1c9b35b85054ee3b83fba49b512cf95b7aa3b27593')

build() {
    arch-meson "$_pkgname-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm644 "$_pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
