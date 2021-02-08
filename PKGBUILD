# Mantainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Old mantainer: Christian Hesse <mail@eworm.de>

_pkgname=libgit2-glib
pkgname=$_pkgname-git
pkgver=v.0.99.0+17+gcaa0b64
pkgrel=1
pkgdesc="GLib wrapper for libgit2"
arch=('any')
url="https://gitlab.gnome.org/GNOME/libgit2-glib"
license=(GPL)
depends=('glib2' 'libgit2' 'gobject-introspection')
makedepends=('git' 'gnome-common' 'gtk-doc')
source=("git+https://gitlab.gnome.org/GNOME/$_pkgname")
conflicts=($_pkgname)
provides=($_pkgname)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
