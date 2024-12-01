# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=sums
pkgver=0.13
pkgrel=1
pkgdesc="Sums is a simple GTK postfix calculator that adheres to GNOME's human-interface guidelines"
arch=('x86_64')
url="https://gitlab.com/leesonwai/sums"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'mpfr')
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream-glib')
source=("${url}/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('0163ef94d62670ed27591398e3509dd4f690eb1453f7d632c0b8e79b02d6fa5eb84efbfe3d03cccbf3205231e8e5f92d106ab4517862c4dfbcc9b647ba4a1785')

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
