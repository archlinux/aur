# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname=amtk
pkgname=$_pkgname-git
pkgver=5.3.1
pkgrel=1
pkgdesc="Actions, Menus and Toolbars Kit for GTK+ applications"
arch=('any')
url="https://wiki.gnome.org/Projects/Amtk"
license=(GPL)
depends=(gtk3)
makedepends=(autoconf-archive git gobject-introspection gtk-doc)
source=("git+https://gitlab.gnome.org/GNOME/$_pkgname")
conflicts=("amtk")
provides=("amtk")
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
