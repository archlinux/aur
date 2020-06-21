# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=svgvi
pkgver=1.6.0
pkgrel=1
pkgdesc="SVG Text Editor and Viewer"
arch=(x86_64)
url="https://gitlab.com/pwmc/svgvi"
license=(GPL3)
depends=(gsvgtk gtksourceview3)
makedepends=(cmake git meson vala)
checkdepends=()
optdepends=()
_commit=09d6675810acf034cd3ef1fe069df78f74ea2854  # tags/1.6.0^0
source=("git+https://gitlab.com/pwmc/svgvi.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
