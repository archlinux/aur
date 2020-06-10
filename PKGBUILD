pkgname=gnome-klotski-git
_pkgname=gnome-klotski
pkgver=3.36.3
pkgrel=1
pkgdesc="Slide blocks to solve the puzzle"
url="https://wiki.gnome.org/Apps/Klotski"
arch=(x86_64)
license=(GPL)
depends=('gtk3' 'librsvg' 'libgnome-games-support')
makedepends=('meson' 'gobject-introspection' 'yelp-tools' 'appstream-glib' 'vala' 'git')
provides=('gnome-klotski')
conflicts=('gnome-klotski')
source=("git+https://gitlab.gnome.org/GNOME/gnome-klotski.git")
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
