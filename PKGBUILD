# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=workbench-git
_pkgname=Workbench
pkgver=r31.9744a10
pkgrel=1
pkgdesc="Playground for GNOME development"
arch=('x86_64')
url="https://github.com/sonnyp/Workbench"
license=('GPL3')
depends=('gtk4' 'glib2' 'gtksourceview5' 'gjs' 'vte3-git')
makedepends=('meson')
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

#prepare() {
#	vte-gtk4-gjs.patch
#}

build() {
  arch-meson "${_pkgname%-git}" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
