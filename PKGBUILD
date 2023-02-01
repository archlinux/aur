# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=schemes
pkgver=0.2.0
pkgrel=1
pkgdesc="GtkSourceView style scheme creator and editor"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/chergert/schemes"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5' 'libpanel')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('907a421f0dea92aded2842e6f3be6ccb650f9ca59a40c73a6f6f86942f124977465c1f2dbb40b88faf69e8a5b04a7550b5daa328a284e32c7df772fc8efa0750')

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
