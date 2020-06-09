pkgname=gnome-nibbles-git
_pkgname=gnome-nibbles
pkgver=3.35.90+14+g557e8e2
pkgrel=1
pkgdesc="Guide a worm around a maze"
url="https://wiki.gnome.org/Apps/Nibbles"
arch=(x86_64)
license=(GPL)
depends=('clutter-gtk' 'gsound' 'librsvg' 'libgnome-games-support' 'libgee')
makedepends=('gobject-introspection' 'yelp-tools' 'appstream-glib' 'vala' 'git' 'meson')
provides=('gnome-nibbles')
conflicts=('gnome-nibbles')
source=("git+https://gitlab.gnome.org/GNOME/gnome-nibbles.git")
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
