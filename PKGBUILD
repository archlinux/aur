# Maintainer: Zhou Qiankang <wszqkzqk@qq.com>

pkgname=live-photo-conv
pkgver=0.2.6
pkgrel=1
pkgdesc="A cross-platform tool to process live photos of Google Android"
url="https://github.com/wszqkzqk/${pkgname}"
arch=('x86_64' 'aarch64' 'riscv64' 'loong64')
license=(LGPL-2.1-or-later)
depends=(
    glib2
    libgexiv2
    gstreamer
    gst-plugins-base-libs
    gst-plugins-good
    gst-plugins-bad
    gdk-pixbuf2
)
makedepends=(
    vala
    meson
    git
    gobject-introspection
)
optdepends=(
    "ffmpeg: FFmpeg backend to convert internal video of a live photo to static pictures"
    "libavif: Support to save as .avif with GStreamer and GdkPixbuf backend"
    "libheif: Support to save photos as .heif, .heic, and .avif with GStreamer and GdkPixbuf backend"
    "libjxl: Support to save photos as .jxl with GStreamer and GdkPixbuf backend"
    "webp-pixbuf-loader: Support to save photos as .webp with GStreamer and GdkPixbuf backend"
)
source=("git+https://github.com/wszqkzqk/${pkgname}.git#tag=${pkgver}")
sha256sums=('661f0ad537aa86f9acdac03ee1a1aa200df9c20be04a27efcde9e287a769b544')

build() {
    arch-meson "${pkgname}" build
    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
    install -Dm644 "${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
