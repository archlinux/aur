# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=clairvoyant
pkgver=3.0.3
pkgrel=1
pkgdesc="Magic 8-Ball fortune teller of sorts"
arch=('x86_64' 'aarch64')
url="https://github.com/cassidyjames/clairvoyant"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'vala')
source=($url/archive/$pkgver.tar.gz)
b2sums=('53f66c3d4b3016f9325ce93b31e8d8d84e73ca4f2fd3bb9f3a140e3d8f34db39383cc087092fdee90ed6ef0693128dfc969ffa0c3f0113467471baea0fce3d87')

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
