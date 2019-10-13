# Contributor:  Jan de Groot <jgc@archlinux.org>
# Maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=gnome-calendar-no-evolution
_pkgname=gnome-calendar
pkgver=3.34.2
pkgrel=1
pkgdesc="Gnome's calender application, now featuring nearly 100% less unnecessary gnome evolution"
url="https://wiki.gnome.org/Apps/Calendar"
arch=(x86_64)
license=(GPL)
depends=(evolution-data-server gsettings-desktop-schemas libdazzle)
makedepends=(python appstream-glib git meson gtk-doc)
optdepends=("evolution: to allow importing .ics files"
            "gnome-control-center: Online services calendar integration")
conflicts=("gnome-calendar")
_commit=98881b9071ce39b8704e9b5af4eb1faa064ba3fa
source=("git+https://gitlab.gnome.org/GNOME/gnome-calendar.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
}

build() {
  arch-meson $_pkgname build \
    --buildtype=debugoptimized \
    -D documentation=true
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}