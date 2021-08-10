# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=sums
pkgver=0.7
pkgrel=3
pkgdesc="Sums is a simple GTK postfix calculator that adheres to GNOME's human-interface guidelines"
arch=('x86_64')
url="https://gitlab.com/leesonwai/sums"
license=('GPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'mpfr')
makedepends=('meson' 'gobject-introspection' 'gobject-introspection-runtime' 'gcc')
checkdepends=('appstream-glib')
source=("${url}/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ad351bd81f10f231bcab75e2e9e9e13d3dd62bcf661b1aad9385abebddbbadf9')

build() {
  arch-meson ${pkgname%-git}-${pkgver} build
  meson compile -C build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" ninja -C build install
}