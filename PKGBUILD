# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=zap-soundboard
pkgver=1.2.2
pkgrel=1
pkgdesc="Play sounds from a soundboard"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/rmnvgr/zap"
license=('GPL3')
depends=('libadwaita' 'gjs' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'tracker3')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/${pkgname%-soundboard}-$pkgver.tar.gz)
b2sums=('1aa079aad3d5af9cffd682e94050aad431e020b5b2e19fbaf05697e1022a298579d27b69eb97d691b3b89b07d8958adcaa4b8c17aa87b0425c2292cfefb890d7')

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
