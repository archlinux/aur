# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=game-of-life
pkgver=0.1.4_3
pkgrel=1
pkgdesc="A simulator of Conway's game of life"
arch=('x86_64' 'aarch64')
url="https://github.com/sixpounder/game-of-life"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($pkgname-$pkgver.tar.gz::$url/archive/v${pkgver//_/-}.tar.gz)
b2sums=('1201790e460afc3e479861bc6114a20379b5346abe85f59103f3987a9d1fe0a3118de6177b7f0be23165573619e6681b4eb2a8b13a0571a1fb21fa8c3806b93e')

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
