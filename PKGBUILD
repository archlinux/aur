pkgname=gnome-screenshot-git
_pkgname=gnome-screenshot
pkgver=3.34.0+14+g67ac52e
pkgrel=1
pkgdesc="Take pictures of your screen"
url="https://gitlab.gnome.org/GNOME/gnome-screenshot"
arch=(x86_64)
license=(GPL2)
depends=('gtk3' 'libcanberra')
makedepends=('git' 'meson' 'appstream-glib')
provides=('gnome-screenshot')
conflicts=('gnome-screenshot')
source=("git+https://gitlab.gnome.org/GNOME/gnome-screenshot.git")
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

# vim:set ts=2 sw=2 et:
