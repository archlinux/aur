# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=viewnior-gtk3-git
pkgver=r314.23ce6e5
pkgrel=1
pkgdesc="Simple, fast and elegant image viewer program. Gtk3 fork"
arch=(x86_64)
url="https://github.com/Artturin/Viewnior"
license=(GPL-3.0-or-later)
depends=(exiv2 gtk3)
makedepends=(meson ninja git glib2-devel)
optdepends=(webp-pixbuf-loader)
provides=(viewnior)
conflicts=(viewnior)
source=("viewnior-artturin::git+https://github.com/Artturin/Viewnior.git") #NB gtk3-and-other is default
sha256sums=('SKIP')

pkgver() {
  cd "viewnior-artturin"
  #git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/viewnior.//'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "viewnior-artturin"
  arch-meson build
  ninja -C build
}

package() {
  cd "viewnior-artturin"
  DESTDIR="${pkgdir}" ninja -C build install
}
