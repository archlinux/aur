# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gsvgtk
pkgver=0.6.3+163+g0bdd6f8
pkgrel=1
pkgdesc="Library providing Gtk+ widgets to view and modify SVG documents"
arch=(x86_64)
url="https://gitlab.com/pwmc/gsvgtk"
license=(LGPL2.1)
depends=(gresg gsvg gtk3)
makedepends=(git meson vala)
_commit=0bdd6f87888da18de77b58dc02826987fca66bb1  # merge-requests/2/merge~15
source=("git+https://gitlab.com/pwmc/gsvgtk#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
