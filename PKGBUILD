# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=glide-player
pkgver=0.5.8
pkgrel=1
pkgdesc="Simple and minimalistic media player relying on GStreamer for the multimedia support and GTK+ for the user interface"
arch=(x86_64)
url="https://github.com/philn/glide"
license=(MIT)
depends=(gst-plugins-bad gst-plugins-base gst-plugins-good gtk3)
makedepends=(git meson rust)
source=("https://github.com/philn/glide/releases/download/$pkgver/glide-$pkgver.tar.xz")
sha256sums=('0c6b793c4b1c02cb071ff2b132c28a5e4c20f1a82e5bdb18600e9962c7e10972')

build() {
  arch-meson glide-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 glide-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
