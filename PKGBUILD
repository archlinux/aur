# Maintainer: Zhou Qiankang <wszqkzqk@qq.com>

pkgname=live-photo-conv
pkgver=0.40.1
pkgrel=1
pkgdesc="A cross-platform tool to process live photos of Google Android"
url="https://github.com/wszqkzqk/${pkgname}"
arch=('x86_64' 'aarch64' 'riscv64' 'loong64')
license=(LGPL-2.1-or-later)
depends=(
    glib2
    libgexiv2
    gtk4
    libadwaita
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
    help2man
    python
)
optdepends=(
    "ffmpeg: FFmpeg backend to convert internal video of a live photo to static pictures"
    "gst-plugin-va: Hardware accelerated video decoding with GStreamer backend"
    "libavif: Support to save as .avif with GStreamer and GdkPixbuf backend"
    "libheif: Support to save photos as .heif, .heic, and .avif with GStreamer and GdkPixbuf backend"
    "libjxl: Support to save photos as .jxl with GStreamer and GdkPixbuf backend"
    "webp-pixbuf-loader: Support to save photos as .webp with GStreamer and GdkPixbuf backend"
)
source=("git+https://github.com/wszqkzqk/${pkgname}.git#tag=${pkgver}")
sha256sums=('277824a2db88641477d9b3783ada8c2c3f101778ef10b2335128893437cb7e84')

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
