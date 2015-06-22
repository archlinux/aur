# Maintainer: Alex Palaistras <alex+archlinux<at>deuill.org>

pkgname=gnome-todo-git
pkgver=245.6581252
pkgrel=1
pkgdesc="Simple to-do list manager for Gnome"
arch=('i686' 'x86_64')
url="https://feaneron.wordpress.com/2015/06/22/introducing-gnome-to-do/"
license=(GPL)
depends=('gtk3' 'evolution-data-server-git')
makedepends=('git' 'gnome-common' 'intltool')
install=gnome-todo.install
source=('git+git://git.gnome.org/gnome-todo')
sha256sums=('SKIP')

build() {
  cd "$srcdir"/gnome-todo
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-schemas-compile
  make
}

package() {
  cd "$srcdir"/gnome-todo
  make DESTDIR="$pkgdir" install
}

pkgver() {
  cd "$srcdir"/gnome-todo
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
