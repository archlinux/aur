# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vector-slicer-git
pkgver=r26.8a31aa1
pkgrel=1
pkgdesc="Export multi-page PDFs from an SVG"
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/vector-slicer"
license=('MIT')
depends=('glib2' 'gdk-pixbuf2' 'gtk3')
makedepends=('git' 'meson' 'rust')
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
  arch-meson ${pkgname%-git} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
