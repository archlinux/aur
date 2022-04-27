# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=amberol
pkgver=0.4.3
pkgrel=1
pkgdesc="Plays music, and nothing else"
arch=('x86_64')
url="https://gitlab.gnome.org/World/amberol"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
b2sums=('065abd0ce70cce37a3b37ceac5d559649e3f3af3e8d9d9d15cba2605a6b87aadba9a0128929b4f684336fba8696101b4e4dfbfbb7a339ba11d2e9360772eda14')

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
