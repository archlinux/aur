# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-polkit-agent-git
pkgver=8.0.0.r32.cae6d867
pkgrel=1
pkgdesc='Pantheon Polkit Agent'
arch=(x86_64)
url=https://github.com/elementary/pantheon-agent-polkit
license=(GPL3)
groups=(pantheon-unstable)
depends=(
  glib2
  glibc
  gtk3
  libgranite.so
  polkit
)
makedepends=(
  git
  granite
  intltool
  meson
  vala
)
provides=(pantheon-polkit-agent)
conflicts=(pantheon-polkit-agent)
source=(pantheon-polkit-agent::git+https://github.com/elementary/pantheon-agent-polkit.git)
sha256sums=(SKIP)

pkgver() {
  cd pantheon-polkit-agent

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  arch-meson pantheon-polkit-agent build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
