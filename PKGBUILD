pkgname=gnome-maps-git
_pkgname=gnome-maps
pkgver=3.35.2+5+g00e18e1
pkgrel=1
pkgdesc="A simple GNOME 3 maps application"
url="https://wiki.gnome.org/Apps/Maps"
arch=(x86_64)
license=(GPL)
depends=('geocode-glib' 'geoclue2' 'gjs' 'libchamplain' 'libgee' 'folks' 'gfbgraph')
makedepends=('gobject-introspection' 'git' 'meson' 'yelp-tools')
provides=('gnome-maps')
conflicts=('gnome-maps')
groups=('gnome')
source=("git+https://gitlab.gnome.org/GNOME/gnome-maps.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $_pkgname
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
