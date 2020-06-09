pkgname=five-or-more-git
_pkgname=five-or-more
pkgver=3.32.0+56+gbe9877f
pkgrel=1
pkgdesc="Remove colored balls from the board by forming lines"
url="https://wiki.gnome.org/Apps/Five%20or%20more"
arch=(x86_64)
license=(GPL)
depends=('gtk3' 'librsvg' 'libgnome-games-support')
makedepends=('gobject-introspection' 'yelp-tools' 'appstream-glib' 'git' 'meson' 'vala')
provides=('five-or-more')
conflicts=('five-or-more')
source=("git+https://gitlab.gnome.org/GNOME/five-or-more.git")
sha512sums=('SKIP')

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
