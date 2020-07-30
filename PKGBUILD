# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=timetrack
pkgver=1.2.2.r0.gf273606
pkgrel=1
pkgdesc="Simple time-tracking app for GNOME"
arch=('any')
url="https://gitlab.gnome.org/danigm/timetrack"
license=('GPL3')
depends=(gobject-introspection libhandy python-timeago)
makedepends=(meson git)
_commit=f273606928ed32bfb5b0994f35dce9efb491241c # version 1.2.2
source=("git+$url#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
