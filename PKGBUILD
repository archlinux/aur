# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=gst-thumbnailers
pkgver=1.0alpha.2
pkgrel=1
pkgdesc="GStreamer video and audio file thumbnailer"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME/$pkgname"
license=('GPL-3.0-or-later')
depends=(
  glib2
  gstreamer
  glycin
)
makedepends=(
  git
  meson
  rust
)
conflicts=(gstreamer-thumbnailer gst-video-thumbnailer)
replaces=(gstreamer-thumbnailer gst-video-thumbnailer)
source=(git+$url.git#tag=${pkgver/[a-z]/.&})
sha256sums=('aa261ac8ee426496d096d19c3715db5add4a0de66f9eec8bd07b103eee34b35e')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir" --no-rebuild
}
