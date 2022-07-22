# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=zenity-light
pkgver=3.43.0
pkgrel=1
pkgdesc="Display graphical dialog boxes from shell scripts. Light version without WekKit2."
url="https://gitlab.gnome.org/GNOME/zenity"
arch=(x86_64)
license=(LGPL)
depends=(gtk3 libnotify)
makedepends=(yelp-tools meson git)
conflicts=("${pkgname%-light}")
provides=("${pkgname%-light}")
options=(debug)
_commit=01e6d92f23f49414ba8ec4c5b3daf49222c1e31d  # tags/3.43.0^0
source=("git+https://gitlab.gnome.org/GNOME/zenity.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd zenity
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd zenity
}

build() {
  arch-meson zenity build \
    -D libnotify=true \
    -D webkitgtk=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
