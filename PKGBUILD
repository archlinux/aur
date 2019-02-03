# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-applications-menu-git
pkgver=2.4.2.r6.58cd96a
pkgrel=1
pkgdesc='The Pantheon Application Menu'
arch=(x86_64)
url=https://github.com/elementary/applications-menu
license=(GPL3)
groups=(pantheon-unstable)
depends=(
  appstream
  gdk-pixbuf2
  glib2
  gnome-menus
  gtk3
  json-glib
  libgee
  libgranite.so
  libsoup
  libswitchboard-2.0.so
  libwingpanel-2.0.so
  plank
  zeitgeist
)
makedepends=(
  git
  meson
  granite-git
  switchboard-git
  vala
  wingpanel-git
)
provides=(pantheon-applications-menu)
conflicts=(pantheon-applications-menu)
source=(
  pantheon-applications-menu::git+https://github.com/elementary/applications-menu.git
  pantheon-applications-menu-plank.patch
)
sha256sums=(
  SKIP
  bf9c6e4eb7bb236e3d740ca8a2e86558ede3efe460a0a44a7ef14a84090b9d5a
)

pkgver() {
  cd pantheon-applications-menu

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

prepare() {
  cd pantheon-applications-menu

  patch -Np1 -i ../pantheon-applications-menu-plank.patch
}

build() {
  arch-meson pantheon-applications-menu build \
    -D b_pie=false \
    -D with-unity=false
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}

# vim: ts=2 sw=2 et:
