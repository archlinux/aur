# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-connections
_pkgname=connections
pkgver=40.0.1
pkgrel=1
pkgdesc="Remote desktop client for the GNOME desktop environment"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/connections"
license=('GPL3')
depends=('gtk-frdp' 'gtk-vnc')
makedepends=('itstool' 'git' 'meson' 'vala')
checkdepends=('appstream-glib')
_commit=d433d4561aca00bd9ebf1cde4b31967d35eca4c4  # tags/v40.0.1
source=("git+https://gitlab.gnome.org/GNOME/connections.git#commit=$_commit")
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
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
