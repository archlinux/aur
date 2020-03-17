# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=gtranslator
pkgname=$_name-git
pkgver=3.36.0.r5043.e98e23a6
pkgrel=1
pkgdesc='Translation Editor, an enhanced gettext po file editor for the GNOME'
arch=('x86_64')
url='https://wiki.gnome.org/Apps/Gtranslator'
license=('GPL3')
depends=(gtksourceview4 gspell gettext libgda libdazzle)
makedepends=(meson gobject-introspection git gtk-doc itstool)
conflicts=($_name)
provides=($_name)
source=("git+https://gitlab.gnome.org/GNOME/$_name")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  v=$(grep -R '^  version:' meson.build | cut -d\' -f2)
  printf "$v.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson $_name build -Dgtk_doc=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
