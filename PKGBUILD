pkgname=gnome-chess-git
_pkgname=gnome-chess
pkgver=3.37.2+3+gaf4e19f
pkgrel=1
pkgdesc="Play the classic two-player boardgame of chess"
url="https://wiki.gnome.org/Apps/Chess"
arch=(x86_64)
license=(GPL)
depends=('gtk3' 'librsvg')
makedepends=('gobject-introspection' 'yelp-tools' 'appstream-glib' 'vala' 'git' 'meson') 
optdepends=('gnuchess: Play against computer')
provides=('gnome-chess')
conflicts=('gnome-chess')
source=("git+https://gitlab.gnome.org/GNOME/gnome-chess.git")
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
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
