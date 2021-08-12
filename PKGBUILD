# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=typography-git
pkgver=r20.bef2431
pkgrel=1
pkgdesc="Tool for working with the GNOME typography design guidelines"
arch=('any')
url="https://gitlab.gnome.org/World/design/typography"
license=('GPL3')
depends=('gtk4')
makedepends=('meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
