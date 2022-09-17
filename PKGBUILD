# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=eartag
pkgver=0.2.1
pkgrel=1
pkgdesc="Simple music tag editor"
arch=('any')
url="https://github.com/knuxify/eartag"
license=('GPL3')
depends=('libadwaita' 'taglib' 'python-gobject' 'python-eyed3' 'python-pillow' 'python-mutagen' 'python-pytaglib' 'python-magic')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/$pkgver.tar.gz)
b2sums=('0e8f1ce84396e2a6a65583c04940d391bbdcca7e3fd439f8216ffb99d43bd9aeb98f15dc3836ffc423b653c1c113ad7e161a97309f52c291501b503969ee4d13')

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
