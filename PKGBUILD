pkgname=gnome-mines-git
_pkgname=gnome-mines
pkgver=3.36.0+27+g55fb096
pkgrel=1
pkgdesc="Clear hidden mines from a minefield"
url="https://wiki.gnome.org/Apps/Mines"
arch=(x86_64)
license=(GPL)
depends=('gtk3' 'librsvg' 'libgnome-games-support')
makedepends=('gobject-introspection' 'yelp-tools' 'appstream-glib' 'vala' 'git' 'meson')
provides=('gnome-mines')
conflicts=('gnome-mines')
source=("git+https://gitlab.gnome.org/GNOME/gnome-mines.git")
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
