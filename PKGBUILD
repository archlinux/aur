# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=gst-thumbnailers
pkgver=1.0rc
pkgrel=1
pkgdesc="GStreamer video and audio file thumbnailer"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME/$pkgname"
license=('GPL-3.0-or-later')
depends=(
  glycin
  gstreamer
  gst-plugins-base
  gst-plugins-base-libs
  gst-plugins-good
  glibc
  glib2
  libgcc
)
makedepends=(
  git
  meson
  rust
)
optdepends=(
  "gst-libav: Extra media decoders (via FFmpeg)"
  "gst-plugins-bad: Extra media decoders"
  "gst-plugins-ugly: Extra media decoders"
)
conflicts=(gstreamer-thumbnailer gst-video-thumbnailer)
replaces=(gstreamer-thumbnailer gst-video-thumbnailer)
source=(git+$url.git#tag=${pkgver/[a-z]/.&})
sha256sums=('6e5511d4b401f8901b8a2cade31e1d65fa3f1e0b1c2d6cbf186505137cbd0b82')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir" --no-rebuild
}
