# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>

_pkgname=libgit2-glib
pkgname=$_pkgname-git
pkgver=1.2.1.r1.gca9e906
pkgrel=1
pkgdesc="GLib wrapper for libgit2"
arch=('any')
url="https://gitlab.gnome.org/GNOME/libgit2-glib"
license=(GPL)
depends=('glib2' 'libgit2' 'gobject-introspection' 'python-gobject')
makedepends=('git' 'gnome-common' 'gtk-doc' 'meson' 'vala' 'glib2-devel')
source=("git+https://gitlab.gnome.org/GNOME/$_pkgname")
conflicts=($_pkgname)
provides=($_pkgname)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
