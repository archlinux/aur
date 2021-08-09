# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=lettercase-git
pkgver=r61.e506357
pkgrel=1
pkgdesc="Your new favorite font manager"
arch=('any')
url="https://gitlab.gnome.org/World/design/lettercase"
license=('GPL3')
depends=('glib2' 'gdk-pixbuf2' 'gtk4' 'libadwaita')
makedepends=('git' 'meson' 'rust')
source=(git+$url.git)
md5sums=(SKIP) #autofill using updpkgsums

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
