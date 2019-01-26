# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=cerbere-git
pkgver=0.2.4
pkgrel=1
pkgdesc='The Pantheon Watchdog'
arch=(x86_64)
url=https://github.com/elementary/cerbere
license=(GPL2)
groups=(pantheon-unstable)
depends=(
  dconf
  glib2
  libgee
)
makedepends=(
  git
  meson
  vala
)
provides=(cerbere)
conflicts=(cerbere)
source=(git+https://github.com/elementary/cerbere.git)
sha256sums=(SKIP)

pkgver() {
  cd cerbere

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  arch-meson cerbere build \
    -D b_pie=false
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}

# vim: ts=2 sw=2 et:
