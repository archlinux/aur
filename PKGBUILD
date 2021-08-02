# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=banner-viewer
pkgver=0.0.1
pkgrel=1
pkgdesc="View and edit GNOME Software banners"
arch=('any')
url="https://gitlab.gnome.org/World/design/$pkgname"
license=('GPL')
depends=('gtk3' 'glib2' 'gdk-pixbuf2' 'libhandy' 'gtksourceview3')
makedepends=('git' 'meson' 'rust')
source=("https://gitlab.gnome.org/World/design/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP') #autofill using updpkgsums

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