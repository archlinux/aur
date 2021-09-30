# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=khronos-git
pkgver=3.6.0.r0.gb36904f
pkgrel=1
pkgdesc="Track each task's time in a simple inobtrusive way"
arch=('any')
url="https://github.com/lainsce/khronos"
license=('GPL3')
depends=('gtk4' 'json-glib' 'libadwaita' 'libgee')
makedepends=('git' 'meson' 'gobject-introspection' 'ninja' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  meson test -C build --print-errorlogs
}

build() {
  arch-meson ${pkgname%-git} build
  meson compile -C build
}

package() {
  cd "$srcdir"
  DESTDIR="${pkgdir}" ninja -C build install
}
