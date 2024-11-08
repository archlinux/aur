# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=sums
pkgver=0.12
pkgrel=1
pkgdesc="Sums is a simple GTK postfix calculator that adheres to GNOME's human-interface guidelines"
arch=('x86_64')
url="https://gitlab.com/leesonwai/sums"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'mpfr')
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream-glib')
source=("${url}/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('94fd4069746ebff7e332aac463e2bf19bf9cab148c1bab2a1a730e10f8a02229e01dea0ce32e8523759870ca2350f34b17c1202714bbcb9fe8f39206f6ec1a4b')

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
