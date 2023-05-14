# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=zap-soundboard
pkgver=1.2.3
pkgrel=1
pkgdesc="Play sounds from a soundboard"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/rmnvgr/zap"
license=('GPL3')
depends=('libadwaita' 'gjs' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'tracker3')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/${pkgname%-soundboard}-$pkgver.tar.gz)
b2sums=('88eead4454a5ce035b382b0e9958baf12fb71d9821b5bf463a0f627d6057f1d14d0b4433c0ace9e1c854570e3c795920714e88fead2ea6a5f2f26ed95eae189c')

build() {
  arch-meson "${pkgname%-soundboard}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
