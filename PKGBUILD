# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=schemes
pkgver=0.1.0
pkgrel=1
pkgdesc="GtkSourceView style scheme creator and editor"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/chergert/schemes"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5' 'libpanel')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('87bf8fa3eb95a6af1436dd7af8766e27e05f3abf89bed7daa480c15d61eba30dc3429cd1c23771abd14b372493755204cb9d54cf5b82988266092b4e5239b33c')

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
