# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-git
pkgver=2.3.2.r31.g92e71f7
pkgrel=1
pkgdesc='Stylish top panel that holds indicators and spawns an application launcher'
arch=(x86_64)
url=https://github.com/elementary/wingpanel
license=(GPL3)
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
  gala-git
  git
  granite-git
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
  arch-meson wingpanel build \
    -D b_pie=false
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}

# vim: ts=2 sw=2 et:
