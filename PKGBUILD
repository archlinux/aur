# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=junction-git
_pkgname=Junction
pkgver=r48.a552f65
pkgrel=1
pkgdesc="Application/browser chooser"
arch=('x86_64')
url="https://github.com/sonnyp/Junction"
license=('GPL3')
depends=('glib2' 'gjs')
makedepends=('meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
