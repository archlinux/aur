# Maintainer: kochan <bifadea02 at disroot dot org>

pkgname=gst-vosk
pkgver=0.3.1
pkgrel=1
pkgdesc="Gstreamer plugin for VOSK voice recognition engine"
arch=('x86_64')
url="https://github.com/PhilippeRo/gst-vosk"
license=("LGPL-2.1-only")
depends=("glib2" "gstreamer")
makedepends=("meson")
source=("https://github.com/PhilippeRo/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d73ae325f921c0e868c727a40e5c846b44b5d1c8002df30df2c5469295798937')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  meson setup builddir --prefix=/usr
  cd builddir
  meson compile
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  meson install -C builddir --destdir "$pkgdir"
  mkdir -p "$pkgdir/usr/share/licenses"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
