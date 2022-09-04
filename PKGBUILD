# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=eartag
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple music tag editor"
arch=('any')
url="https://github.com/knuxify/eartag"
license=('GPL3')
depends=('libadwaita' 'taglib' 'python-gobject' 'python-eyed3' 'python-pillow' 'python-mutagen' 'python-pytaglib' 'python-magic')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/$pkgver.tar.gz)
b2sums=('43a1ea5ff999faf879a08a41da6031757c486bb46142def60adbe868adec14144d2ce9732a368c97d9dc7dc15098ce2ea7b0b246543d2be38ea46efd1c25dd39')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
