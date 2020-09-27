pkgname=devhelp-git
_pkgname=devhelp
pkgver=3.38.0+4+g5eb0b92c
pkgrel=1
pkgdesc="API documentation browser for GNOME"
arch=(x86_64)
license=(GPL)
url="https://wiki.gnome.org/Apps/Devhelp"
depends=('webkit2gtk' 'amtk')
makedepends=('gtk-doc' 'git' 'appstream-glib' 'gobject-introspection' 'meson' 'yelp-tools')
provides=('devhelp')
conflicts=('devhelp')
source=("git+https://gitlab.gnome.org/GNOME/devhelp.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build -D gtk_doc=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
