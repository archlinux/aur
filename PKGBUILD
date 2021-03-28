pkgname=gnome-text-editor-dev
_pkgname=gnome-text-editor
pkgver=3.39.92+39+g1421ecc
pkgrel=1
pkgdesc="A simple Text Editor for GNOME"
url="https://gitlab.gnome.org/GNOME/gnome-text-editor"
arch=(x86_64)
license=(GPL)
depends=('gtk4' 'libadwaita-git' 'gtksourceview5-dev')
makedepends=('python' 'gcc' 'git' 'meson')
provides=('gnome-text-editor')
conflicts=('gnome-text-editor')
source=("git+https://gitlab.gnome.org/chergert/gnome-text-editor.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
