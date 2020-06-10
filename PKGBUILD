pkgname=gnome-robots-git
_pkgname=gnome-robots
pkgver=3.37.2+2+g40c285d
pkgrel=1
pkgdesc="Avoid the robots and make them crash into each other"
url="https://wiki.gnome.org/Apps/Robots"
arch=(x86_64)
license=(GPL)
depends=('gtk3' 'gsound' 'librsvg' 'libgnome-games-support')
makedepends=('meson' 'gobject-introspection' 'yelp-tools' 'appstream-glib' 'git')
provides=('gnome-robots')
conflicts=('gnome-robots')
source=("git+https://gitlab.gnome.org/GNOME/gnome-robots.git")
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
