# Maintainer: Jonathon Fernyhough <jonathon+m2x+dev>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Davide Depau <davide@depau.eu>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Marco Melorio <marco.melorio@protonmail.com>
# Contributor: Bakasura <bakasura@protonmail.ch>

pkgname=libadwaita
pkgver=1.0.0alpha1
pkgrel=1
pkgdesc="Library to help with developing UI for mobile devices using GTK/GNOME"
url="https://gitlab.gnome.org/GNOME/$pkgname"
license=(LGPL)
arch=(i686 x86_64 armv7h armv8h aarch64)
depends=(gtk4)
makedepends=(gobject-introspection meson sassc vala wayland-protocols)
#checkdepends=(xorg-server-xvfb)
provides=(libadwaita-1.so)
_commit=faa9f26a2b8a89923c0b83d42e84078f672c19ec
source=("$url/-/archive/$_commit/$pkgname-$_commit.tar.gz")
b2sums=('0ef4d249d562fd37805c853cca24d8dbf06ae91792a49d4df01546b761e5c347fdbf0e821701d79f172136490b8b7445a1689e200d69674b38a930dc81db6b0d')

build() {
    arch-meson $pkgname-$_commit build -Dtests=false -Dexamples=false
    ninja -C build
}

#check() {
#    dbus-run-session xvfb-run \
#      -s '-screen 0 1920x1080x24 -nolisten local' \
#      meson test -C build --print-errorlogs
#}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
