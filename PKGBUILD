# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

_pkgname="cheese"
pkgname="$_pkgname"-git
pkgver=3.34.0+21+ga6c7313d
pkgrel=1
pkgdesc="An object oriented GL/GLES Abstraction/Utility Layer"
url="https://blogs.gnome.org/clutter/"
arch=(x86_64)
license=(GPL2)
depends=(mesa libdrm libxext libxdamage libxcomposite gdk-pixbuf2 pango libxrandr)
makedepends=(gobject-introspection git gtk-doc)
_commit=60015d7d9756a89fb608887b52fa6b6a5a7db18d  # tags/1.22.4^0
provides=("$_pkgname")
conflicts=("$_pkgname" "cogl-git")
replaces=("$_pkgname")
source=("git+https://gitlab.gnome.org/GNOME/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build -D documentation=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}


# vim:set ts=2 sw=2 et:
