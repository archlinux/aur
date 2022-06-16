# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=amberol
pkgver=0.7.0
pkgrel=2
pkgdesc="Plays music, and nothing else"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/amberol"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib' 'reuse')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('6b3b67f8c7ff3ea1667b840b8c9e21106c81b21ff61df60e4058907bba997beb964d4d79b0f23b53d998a313f026511199a69f07aaebbbe1daca323dd0482d8a')

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
