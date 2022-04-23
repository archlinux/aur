# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=amberol
pkgver=0.4.2
pkgrel=1
pkgdesc="Plays music, and nothing else"
arch=('x86_64')
url="https://gitlab.gnome.org/World/amberol"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
b2sums=('5daf6d2729d0a93f38b187b0e1ace4abd72fa8a39d6da57aef2cb7c80181f43e1852c2dac138fe34bd84248e34bebdc9ee8339499fd9401a8a7356b6f6ebd3ab')

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
