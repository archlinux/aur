# Maintainer: Sung Mingi <FiestaLake@protonmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-calculator-git
_pkgname=gnome-calculator
pkgver=42.0+r38+gba8e98d6
pkgrel=1
pkgdesc="GNOME Scientific calculator - git"
url="https://wiki.gnome.org/Apps/Calculator"
arch=(x86_64 i686 aarch64 armv7h)
license=(GPL)
depends=(libadwaita dconf gtksourceview5 mpfr libsoup libmpc libgee libhandy)
makedepends=(yelp-tools vala git meson gobject-introspection)
groups=(gnome)
provides=(gnome-calculator)
conflicts=(gnome-calculator)
# options=(debug)
source=("git+https://gitlab.gnome.org/GNOME/gnome-calculator.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
