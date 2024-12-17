# Maintainer: q234 rty <q23456yuiop at gmail dot com>

pkgname=permission-viewer-git
_pkgname=permission-viewer
pkgver=r11.ebb3704
pkgrel=1
pkgdesc='A quick application to display the Flatpak permission store'
arch=(x86_64)
url=https://github.com/matthiasclasen/permission-viewer
license=(LGPL-2.1-only)
depends=(
  gcc-libs
  glib2
  glibc
  gtk3
  xdg-desktop-portal
)
makedepends=(
  git
  glib2-devel
  meson
)
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd $_pkgname
  git cherry-pick -n ba45366f519c9913bb707b4f1026381e112cdb0b
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
