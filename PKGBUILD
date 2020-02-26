pkgname=gnome-todo-git
_pkgname=gnome-todo
pkgver=3.91.1+448+g34ddbcc
pkgrel=1
pkgdesc="Simple to-do list manager for Gnome"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Todo"
license=(GPL)
depends=('gtk3' 'evolution-data-server-git')
makedepends=('git' 'gnome-common' 'intltool')
install=gnome-todo.install
source=('git+https://gitlab.gnome.org/GNOME/gnome-todo.git')
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
