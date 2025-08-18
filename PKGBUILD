# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=gst-video-thumbnailer
pkgver=0.1
pkgrel=1
pkgdesc="A simple gstreamer thumbnailer written in Rust"
arch=('x86_64')
url="https://gitlab.gnome.org/sophie-h/$pkgname"
license=('GPL-3.0-or-later')
depends=(glib2 gstreamer)
makedepends=(rust)
conflicts=(gstreamer-thumbnailer)
replaces=(gstreamer-thumbnailer)
source=(
  "git+$url.git"
  $pkgname.thumbnailer
)
sha256sums=('SKIP'
            '8b6c533f9a6750480b6a9617e1ea38c9b2c4bcc70a27c0624c333f0d5e392f0b')

build() {
  cd "$srcdir"/$pkgname
  cargo build --release
}

package() {
  cd "$srcdir"/$pkgname
  cargo install --no-track --locked --root "$pkgdir"/usr/ --path .

  install -Dm644 "$srcdir"/$pkgname.thumbnailer -t "$pkgdir"/usr/share/thumbnailers/
}
