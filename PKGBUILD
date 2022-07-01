# Maintainer: Sergii Fesenko <sergii underscore f dot at outlook dot com>

pkgname=granite7-git
_pkgname=${pkgname%-git}
pkgver=7.0.0.r11.f476f592
pkgrel=1
pkgdesc='Library that extends GTK with common widgets and utilities'
arch=(x86_64)
url=https://github.com/elementary/granite
license=(LGPL3)
groups=(pantheon-unstable)
depends=(
  gtk4
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
  granite7
  libgranite-7.so
)
source=(
  "${_pkgname}::git+https://github.com/elementary/granite.git#branch=main"
  )
sha256sums=(SKIP)

pkgver() {
  cd ${_pkgname}

  git describe --tags --long | sed 's/-/.r/; s/-g/./'
}

build() {
  arch-meson ${_pkgname} build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}

# vim: ts=2 sw=2 et:
