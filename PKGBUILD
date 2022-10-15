# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=zap-soundboard
pkgver=1.2.1
pkgrel=1
pkgdesc="Play sounds from a soundboard"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/rmnvgr/zap"
license=('GPL3')
depends=('libadwaita' 'gjs' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'tracker3')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/${pkgname%-soundboard}-$pkgver.tar.gz)
b2sums=('7b0ba7a9df18cabab0cf314d3899e34e0e56f363f39568fb6828c2567474168090e408ca707aebd1243e66fd18ae260a2036f7921acee917468ab07c20e7103e')

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
