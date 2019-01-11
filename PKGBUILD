# Maintainer: Ricardo Liang (rliang) <ricardoliang@gmail.com>

pkgname=gnome-backgrounds-git
pkgver=3.30.0+19+g8d77ab7
pkgrel=1
pkgdesc="Background images and data for GNOME"
url="https://gitlab.gnome.org/GNOME/gnome-backgrounds"
arch=(any)
provides=(gnome-backgrounds)
conflicts=(gnome-backgrounds)
makedepends=(glib2 meson)
license=(GPL)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gnome-backgrounds.git")
sha256sums=('SKIP')

pkgver() {
  cd gnome-backgrounds
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson gnome-backgrounds build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set sw=2 et:
