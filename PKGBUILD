# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=purism-stream
_pkgname=Stream
pkgver=0.1.6
pkgrel=1
pkgdesc="YouTube client for GNOME, built for the Librem 5"
arch=('x86_64')
url="https://source.puri.sm/todd/Stream"
license=('GPL3')
depends=('gtk3' 'libhandy' 'pulseaudio')
makedepends=('meson' 'python')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=('5d29c482fb006e1bfd05410b92aa4f12b473c9a9651a1da7dbccfa60fecb6bcd')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
