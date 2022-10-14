# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=game-of-life
pkgver=0.1.3
pkgrel=1
pkgdesc="A simulator of Conway's game of life"
arch=('x86_64' 'aarch64')
url="https://github.com/sixpounder/game-of-life"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
b2sums=('a840a7a32fae36cece0b95fdb52692c2d4a558651d080f7fa666b2b1e5595d5b56e43f362c36405efe713667513b23c5bf9b20a4872b65bfd49d8d8d7a531529')

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
