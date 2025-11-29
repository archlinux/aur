# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=gst-thumbnailers
pkgver=1.0alpha.1
pkgrel=2
pkgdesc="A simple gstreamer thumbnailer written in Rust"
arch=(x86_64)
url="https://gitlab.gnome.org/sophie-h/$pkgname"
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
sha256sums=('e636c79e03d09e3a661ee530a97055be08d983993c2c7c99ff390b45cf1a1f61')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir" --no-rebuild
}
