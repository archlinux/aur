# Maintainer: Sergii Fesenko <sergii_f@outlook.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=granite-git
_pkgname=granite
pkgver=6.2.0.r15.3fc535f5
pkgrel=1
pkgdesc='Library that extends GTK with common widgets and utilities'
arch=(x86_64)
url=https://github.com/elementary/granite
license=(LGPL3)
groups=(pantheon-unstable)
depends=(
  gtk3
  libgee
)
makedepends=(
  git
  gobject-introspection
  meson
  ninja
  vala
)
provides=(
  granite
  libgranite.so
)
source=(git+https://github.com/elementary/granite.git)
sha256sums=(SKIP)

pkgver() {
  cd ${srcdir}/${_pkgname}

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  arch-meson ${_pkgname} build \
    -D b_pie='false'
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}

# vim: ts=2 sw=2 et:
