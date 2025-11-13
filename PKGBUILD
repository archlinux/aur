# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=gst-video-thumbnailer
pkgver=0.1
_commit=3894a2ff
pkgrel=3
pkgdesc="A simple gstreamer thumbnailer written in Rust (deprecated, use gst-thumbnailers instead)"
arch=(x86_64)
url="https://gitlab.gnome.org/sophie-h/$pkgname"
license=('GPL-3.0-or-later')
depends=(
  glib2
  gstreamer
)
makedepends=(
  git
  meson
  rust
)
conflicts=(gstreamer-thumbnailer)
replaces=(gstreamer-thumbnailer)
source=(git+$url.git#commit=$_commit)
sha256sums=('a899f3fe32e3dd85ce1aef5a33adc7cac6f0e2e63864827dbdc684c121dd66f4')

prepare() {
  # Fix thumbnailer file
  sed -i 's#--input #--input-uri #g' "$srcdir"/gst-video-thumbnailer/gst-video.thumbnailer.in
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir" --no-rebuild
}
