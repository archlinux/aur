# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-git
pkgver=3.0.5.r94.ge5fa914
pkgrel=1
pkgdesc='Stylish top panel that holds indicators and spawns an application launcher'
arch=(x86_64)
url=https://github.com/elementary/wingpanel
license=(GPL-3.0-or-later)
groups=(pantheon-unstable)
depends=(
  glib2
  gtk3
  libgala.so
  libgee
  libgranite.so
  mutter
)
makedepends=(
  gala
  git
  granite
  meson
  vala
)
provides=(
  libwingpanel.so
  wingpanel
)
conflicts=(wingpanel)
source=(git+https://github.com/elementary/wingpanel.git)
sha256sums=(SKIP)

pkgver() {
  cd wingpanel

   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson wingpanel build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}

# vim: ts=2 sw=2 et:
