# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-calculator-git
pkgver=3.31.3.r3.gaf52f787
pkgrel=1
pkgdesc="GNOME Scientific calculator"
url="https://wiki.gnome.org/Apps/Calculator"
arch=(i686 x86_64 armv6h armv7h)
license=(GPL)
depends=(gtksourceview4 libmpc)
makedepends=(yelp-tools vala git appstream-glib meson)
provides=(gnome-calculator)
conflicts=(gnome-calculator)
groups=(gnome)
options=(!emptydirs)
source=("git+https://gitlab.gnome.org/GNOME/gnome-calculator.git")
sha256sums=('SKIP')

pkgver() {
  cd gnome-calculator
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson gnome-calculator build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
