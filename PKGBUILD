# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=sums
pkgver=0.15
pkgrel=1
pkgdesc="Sums is a simple GTK postfix calculator that adheres to GNOME's human-interface guidelines"
arch=('x86_64')
url="https://gitlab.com/leesonwai/sums"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'mpfr')
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream-glib')
source=("${url}/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('3c5dcca6b0820fb5888fdd4ee4c3c47ab9f0cf6fe9a733b4b01c1c3de324387fe13e0ee742086cea66ef7e867c7437bad86de1100cf9b7f875bb80cdc5093d47')

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
