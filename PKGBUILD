# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=amberol
pkgver=0.9.0
pkgrel=1
pkgdesc="Plays music, and nothing else"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/amberol"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib' 'reuse')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('76cd279f807b014e9811504c56b0c59d7b2ec4da85682e7935dc3884f09346fefd619b0b6f1f34e581b6ff2fd601cd366303a73f9188fd778d5cb7a0b19b4cb1')

build() {
  arch-meson --buildtype release "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
