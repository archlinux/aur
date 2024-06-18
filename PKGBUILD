# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=schemes
pkgver=46.0
pkgrel=1
pkgdesc="GtkSourceView style scheme creator and editor"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/chergert/schemes"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5' 'libpanel')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('3f4347cb89c578efc973d9b2a5402d3fdb54d023750efb473099fb9f4d0325624ec0487a55e36546a3ff3f03916f77b78a643a673dc41a1916f52d2cbef9dd75')

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
