# Maintainer: soloturn@gmail.com

_basename=libdecoration
pkgname="$_basename-git"
pkgver=r62.0c70968
pkgrel=1
pkgdesc="Help Wayland clients draw window decorations for them."
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/jadahl/libdecoration"
license=('MIT')
makedepends=('git' 'meson' 'ninja')
conflicts=("$_basename")
provides=("$_basename")

source=("git+https://gitlab.gnome.org/jadahl/$_basename.git")
sha1sums=('SKIP')

pkgver() {
  cd "$_basename"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  pwd
  arch-meson $_basename build
  ninja -C build
}

package() {
  pwd
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:

