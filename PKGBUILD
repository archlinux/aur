# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=zap-soundboard
pkgver=1.2.0
pkgrel=1
pkgdesc="Play sounds from a soundboard"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/rmnvgr/zap"
license=('GPL3')
depends=('libadwaita' 'gjs' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'tracker3')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/${pkgname%-soundboard}-$pkgver.tar.gz)
b2sums=('3aa19f285f90a8df3bfb7a68c7207ba2eeca1c46b5d0e8f7209d9d159610a1db95b16c6ad916d804428c5d106722e83ef052ed0acfe784029c543197f00e8352')

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
