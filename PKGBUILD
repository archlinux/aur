# Maintainer: orlfman
pkgname=ffmpeg-converter-gtk
_pkgname=FFmpeg-Converter-GTK
pkgver=2.0.1
pkgrel=1
pkgdesc="Modern GTK4 + libadwaita frontend for FFmpeg (SVT-AV1, x265, x264, VP9)"
arch=('x86_64')
url="https://github.com/orlfman/FFmpeg-Converter-GTK"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'json-glib' 'glib2' 'libsoup3'
         'mpv' 'cairo' 'pango' 'glibc' 'hicolor-icon-theme'
         'ffmpeg')
makedepends=('meson' 'vala')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d23f15b750068801c69e728c2786f64026e3c010b6ffcc459cafc50b580d43c8')

build() {
    arch-meson "$_pkgname-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm644 "$_pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
