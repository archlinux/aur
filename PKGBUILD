# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgname=carburetor
pkgver=5.1.0
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
sha256sums=('41871ef33ec262e3a31b3d919f65beeecc60775a97e497bde61a06ac7d40da7e')

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
