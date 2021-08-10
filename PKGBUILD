# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=sums-git
pkgver=0.7.r5.g5038662
pkgrel=1
pkgdesc="Sums is a simple GTK postfix calculator that adheres to GNOME's human-interface guidelines"
arch=('x86_64')
url="https://gitlab.com/leesonwai/sums"
license=('GPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'mpfr')
makedepends=('meson' 'gobject-introspection' 'gobject-introspection-runtime' 'gcc')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson ${pkgname%-git} build
  meson compile -C build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" ninja -C build install
}
