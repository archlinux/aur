# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Davide Depau <davide@depau.eu>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Marco Melorio <marco.melorio@protonmail.com>
# Contributor: Bakasura <bakasura@protonmail.ch>
# Contributor: Luna Jernberg <droidbittin@gmail.com>

_pkgname=libadwaita
pkgname=$_pkgname-git
pkgver=1.1.beta.r5.ge70ae74d
pkgrel=1
pkgdesc="Library full of GTK widgets for mobile phones"
url="https://gitlab.gnome.org/GNOME/$_pkgname"
license=(LGPL)
arch=(i686
      pentium4
      x86_64)
depends=(gtk4)
makedepends=(git gobject-introspection meson sassc vala wayland-protocols)
checkdepends=(xorg-server-xvfb)
source=("git+$url")
provides=($_pkgname)
conflicts=($_pkgname)
md5sums=(SKIP)

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson $_pkgname build -Dgtk_doc=false -Dexamples=true
    DESTDIR="$pkgdir" ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
