pkgname=tepl-git
_pkgname=tepl
pkgver=5.1.1+106+g86f30c2
pkgrel=1
pkgdesc="Library that eases the development of GtkSourceView-based text editors and IDEs"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/Tepl"
license=(LGPL2.1)
depends=('amtk' 'gtksourceview4' 'uchardet')
makedepends=('git' 'gobject-introspection' 'gtk-doc' 'meson' 'vala')
provides=('tepl')
conflicts=('tepl')
source=("git+https://gitlab.gnome.org/GNOME/tepl.git/")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
