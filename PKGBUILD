# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=gnome-2048
pkgname=$_name-git
pkgver=3.38.0.r0.g76a9159
pkgrel=1
pkgdesc="Obtain the 2048 tile"
arch=(x86_64)
url="https://wiki.gnome.org/Apps/2048"
license=(GPL)
depends=(clutter-gtk libgnome-games-support)
makedepends=(git meson appstream-glib yelp-tools vala)
provides=($_name)
conflicts=($_name)
source=("git+https://gitlab.gnome.org/GNOME/$_name.git")
md5sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $_name build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
