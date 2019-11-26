# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=elementary-wallpapers-git
pkgver=r124.47b25c2
pkgrel=1
pkgdesc='Collection of wallpapers for elementary OS'
arch=(any)
url=https://github.com/elementary/wallpapers
license=(GPL3)
groups=(pantheon-unstable)
makedepends=(
  git
  meson
)
provides=(elementary-wallpapers)
conflicts=(elementary-wallpapers)
source=(elementary-wallpapers::git+https://github.com/elementary/wallpapers.git)
sha256sums=(SKIP)

pkgver() {
  cd elementary-wallpapers

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson elementary-wallpapers build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
