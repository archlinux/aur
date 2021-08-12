# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vector-slicer
pkgver=0.0.2
pkgrel=2
pkgdesc="Export multi-page PDFs from an SVG"
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/vector-slicer"
license=('MIT')
depends=('glib2' 'gdk-pixbuf2' 'gtk3')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha256sums=('51711254f82c7da5d7d345d318d0f74db739390dbd96c9f221567b771e320a62')

build() {
  arch-meson $pkgname-v$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}