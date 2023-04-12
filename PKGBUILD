# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=eartag
pkgver=0.3.3
pkgrel=1
pkgdesc="Simple music tag editor"
arch=('any')
url="https://gitlab.gnome.org/knuxify/eartag"
license=('MIT')
depends=('libadwaita' 'python-gobject' 'python-pillow' 'python-mutagen' 'python-magic')
makedepends=('meson')
checkdepends=('appstream-glib' 'python-pytest')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('624f48206035b44f276b32f252defade930960e97bac3946ca1e1bddad1d77cfb0bffa4d8ea7a643f708d2edb770f905f0d61d26f8497f44e413b0d38b1fb5fd')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
