# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=gnome-todo
pkgver=3.18.1
pkgrel=1
pkgdesc='a personal task manager for GNOME'
arch=('i686' 'x86_64')
url='https://wiki.gnome.org/Apps/ToDo'
license=('GPL3')
depends=('evolution-data-server')
makedepends=('intltool' 'gnome-common' 'appstream-glib')
install='gnome-todo.install'
source=("https://git.gnome.org/browse/${pkgname}/snapshot/GNOME_TODO_$(echo ${pkgver}|sed 's|\.|_|g').tar.xz")
sha256sums=('52cd2eabb7f46d8f67f2047e6ce158d51fa28e319893c2b19bd399520cbbbbdc')

_srcname="GNOME_TODO_$(echo ${pkgver}|sed 's|\.|_|g')"

build() {
  cd "$srcdir/$_srcname"
  ./autogen.sh --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$_srcname"
  make DESTDIR="${pkgdir}" install
}
