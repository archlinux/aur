# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=symbolic-preview
pkgver=0.0.2
pkgrel=1
pkgdesc="Symbolics made easy"
arch=('any')
url="https://gitlab.gnome.org/World/design/symbolic-preview"
license=('GPL3')
depends=('gtk3' 'gdk-pixbuf2' 'glib2')
makedepends=('meson' 'rust' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('afdcb5dd7e2e8e43daf4831af8e77b545c33e91e71ae77aa675bcb42705f88f9')

prepare() {
  cd "${pkgname%-git}-$pkgver"
  cargo update
}

build() {
  arch-meson "${pkgname%-git}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
