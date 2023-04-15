# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=swatch
pkgver=1.1
pkgrel=1
pkgdesc="Color palette manager"
arch=('any')
url="https://gitlab.gnome.org/GabMus/swatch"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'gobject-introspection' 'blueprint-compiler')
checkdepends=('appstream')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
b2sums=('586ef69320e9c780b3031bc98f88e458feb1338de4b06cfa3bb9801ef1d88090863eb1febcedcdc4e3f3e72262c3e912f41a4903902f667175ec3e8f943fe1c1')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
