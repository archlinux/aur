# Maintainer: Daniel Playfair Cal (hedgepigdaniel) <daniel.playfair.cal@gmail.com>

pkgname=gtk-layer-shell-git
_pkgname=gtk-layer-shell
pkgver=r264.a79edbb
pkgrel=1
provides=(gtk-layer-shell)
conflicts=(gtk-layer-shell)
pkgdesc="A library to create desktop components for Wayland using the Layer Shell protocol"
arch=(x86_64)
url="https://github.com/wmww/gtk-layer-shell"
makedepends=(meson wayland gtk3 gobject-introspection)
source=("git+https://github.com/wmww/gtk-layer-shell.git")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
}

build() {
  meson $_pkgname build --prefix=/usr
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set sw=2 et:
md5sums=('SKIP')
