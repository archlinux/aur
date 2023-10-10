# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=gtranslator
pkgname=$_name-git
pkgver=45.2.r5728.2efbde35
pkgrel=1
pkgdesc='An enhanced gettext po file editor for the GNOME desktop environment'
arch=('x86_64')
url='https://projects.gnome.org/gtranslator/'
license=('GPL3')
depends=('gtksourceview5' 'gettext' 'libadwaita' 'libgda6' 'iso-codes'
         'hicolor-icon-theme' 'libspelling')
makedepends=('meson' 'gobject-introspection' 'yelp-tools' 'git')
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
  arch-meson $_name build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir="$pkgdir"
}
