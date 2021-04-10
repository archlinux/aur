# Maintainer: Jonathon Fernyhough <jonathon+m2x+dev>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Davide Depau <davide@depau.eu>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Marco Melorio <marco.melorio@protonmail.com>
# Contributor: Bakasura <bakasura@protonmail.ch>

pkgname=libadwaita
pkgver=1.0r1596.65ac525
pkgrel=1
pkgdesc="Library to help with developing UI for mobile devices using GTK/GNOME"
url="https://gitlab.gnome.org/GNOME/$pkgname"
license=(LGPL)
arch=(i686 x86_64 armv7h armv8h aarch64)
depends=(gtk4)
makedepends=(gobject-introspection meson sassc vala wayland-protocols)
#checkdepends=(xorg-server-xvfb)
provides=(libadwaita-1.so)
_commit=65ac5258cdcd1c1bfdf2d8f29c9518e16bcca445
source=("$url/-/archive/$_commit/$pkgname-$_commit.tar.gz")
b2sums=('72770f2e35dc83198cddf97878dfebbd967ce204b33389078f09b95a33b27f6e37ed9d3b6a24cd9bf0eb03c1883180a130a010fa92ba56214b87683f8548ead6')

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
