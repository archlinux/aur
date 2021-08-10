# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=banner-viewer-git
pkgver=0.0.1.r18.g612b002
pkgrel=1
pkgdesc="View and edit GNOME Software banners"
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/banner-viewer"
license=('GPL')
depends=('gtk3' 'glib2' 'gdk-pixbuf2' 'libhandy' 'gtksourceview4')
makedepends=('git' 'meson' 'rust')
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

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
