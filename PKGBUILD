# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=amberol
pkgver=0.5.0
pkgrel=1
pkgdesc="Plays music, and nothing else"
arch=('x86_64')
url="https://gitlab.gnome.org/World/amberol"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
b2sums=('b275c7d2139e581902f1ed1b30a39d46f7f3e63fd13a9641234c64555ccac8ddb8654b67d2e94cdede7bcb55b778bca6a7c16f0358678599976e8fed9a23a600')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
