# Maintainer: Ricardo Liang (rliang) <ricardoliang@gmail.com>

pkgname=gnome-characters-git
pkgver=3.30.0+20+ga4ac93e
pkgrel=1
pkgdesc="A character map application"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME/gnome-characters"
license=(GPL2)
provides=(gnome-characters)
conflicts=(gnome-characters)
depends=(gjs gtk3 libunistring gnome-desktop)
makedepends=(meson intltool gobject-introspection appstream-glib git gperf)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gnome-characters.git")
sha256sums=('SKIP')

pkgver() {
  cd gnome-characters
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  arch-meson gnome-characters build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
