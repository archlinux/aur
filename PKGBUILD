# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-git
pkgver=r382.dd64ba8
pkgrel=1
pkgdesc='Stylish top panel that holds indicators and spawns an application launcher'
arch=(x86_64)
url='https://github.com/elementary/wingpanel'
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
  libwingpanel-2.0.so
  wingpanel
)
conflicts=(wingpanel)
source=(git+https://github.com/elementary/wingpanel.git)
sha256sums=(SKIP)

pkgver() {
  cd wingpanel

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson wingpanel build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
