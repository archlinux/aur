# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=banner-viewer
pkgver=0.0.1
pkgrel=2
pkgdesc="View and edit GNOME Software banners"
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/banner-viewer"
license=('GPL')
depends=('gtk3' 'glib2' 'gdk-pixbuf2' 'libhandy' 'gtksourceview3')
makedepends=('git' 'meson' 'rust')
checkdepends=('appstream-glib')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e5b3a9a7a38d95a68e27116dd1d039697a738b5008eff4493ecac3ad26d686ab')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}