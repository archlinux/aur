# Maintainer: Husam Bilal <husam212@gmail.com>

pkgname="gnome-backgrounds-bitday-git"
_pkgname="gnome-backgrounds-bitday"
pkgver=r23.0889d85
pkgrel=1
pkgdesc="Beautiful dynamic pixel wallpaper for GNOME"
url="https://github.com/ghisvail/gnome-backgrounds-bitday"
depends=("gnome-backgrounds")
makedepends=("git" "make" "meson")
provides=("gnome-backgrounds-bitday")
license=("UNLICENSE")
arch=("any")
source=("git+https://github.com/ghisvail/${_pkgname}.git")
md5sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  meson --prefix=/usr builddir
  ninja -C builddir
}

package() {
  cd "$_pkgname"
  DESTDIR="$pkgdir" ninja -C builddir install
}
