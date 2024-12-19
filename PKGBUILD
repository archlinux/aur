# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgname=carburetor
pkgver=5.0.0
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
sha256sums=('c7019f51e146f4aadb8e10c0459de49cb20cbdeb904425efc4a5264945ad5bec')

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
