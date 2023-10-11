# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=lorem
pkgver=1.3
pkgrel=1
pkgdesc="Simple app to generate the Lorem Ipsum placeholder text"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/design/lorem"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('e060bf8c41cc26a7298009ce1735204a7484921e782db538ae59b31d9c6eb72ad9e65aacd70b20b4452a9ab959a82f4d2d1037df9b855d1e9a1540135f91b885')

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
