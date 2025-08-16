# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=gstreamer-thumbnailer
pkgver=0.1
pkgrel=1
pkgdesc="A simple gstreamer thumbnailer written in Rust"
arch=('x86_64')
url="https://gitlab.gnome.org/sophie-h/gstreamer-thumbnailer"
license=('GPL-3.0-or-later')
depends=(glib2 gstreamer)
makedepends=(rust)
source=(
  "git+$url.git"
  gstreamer-thumbnailer.thumbnailer
)
sha256sums=('SKIP'
            'e4582720078ccb73e997d891e582f95851fb0e13d93cc21fb511e528059f7df4')

build() {
  cd "$srcdir"/$pkgname
  cargo build --release
}

package() {
  cd "$srcdir"/$pkgname
  cargo install --no-track --locked --root "$pkgdir"/usr/ --path .

  install -Dm644 "$srcdir"/gstreamer-thumbnailer.thumbnailer -t "$pkgdir"/usr/share/thumbnailers/
}
