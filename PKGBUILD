# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgname=carburetor
pkgver=5.1.1
pkgrel=1
pkgdesc='Graphical settings app for tractor in GTK'
arch=(any)
url='https://framagit.org/tractor/carburetor'
license=('GPL-3.0-or-later')

depends=(
  python
  python-gobject
  python-pycountry
  gtk4
  glib2
  libadwaita
  tractor
)
makedepends=(
  meson
)

source=("$pkgname-$pkgver.tar.gz::https://framagit.org/tractor/carburetor/-/archive/$pkgver/carburetor-$pkgver.tar.gz")
sha256sums=('f747846b275bcef8dd8559d10d4a65c101fb998a37ef4beae51fe7a4c27613e3')

build() {
  arch-meson --reconfigure "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
