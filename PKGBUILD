# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=sums
pkgver=0.7
pkgrel=1
pkgdesc="Sums is a simple GTK postfix calculator that adheres to GNOME's human-interface
guidelines"
arch=('any')
url="https://gitlab.com/leesonwai/sums"
license=('GPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'mpfr')
makedepends=('meson' 'gobject-introspection' 'gobject-introspection-runtime' 'gcc')
optdepends=('appstream-util')
source=("${url}/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('SKIP') #autofill using updpkgsums

build() {
  arch-meson ${pkgname%-git}-${pkgver} build
  meson compile -C build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" ninja -C build install
}