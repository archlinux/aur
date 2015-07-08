# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=gdl-git
pkgver=3.16.0.4.g727c4d0
pkgrel=1
pkgdesc="GNOME Docking Libraries, git version"
arch=('i686' 'x86_64')
url="https://developer.gnome.org/gdl/"
license=('GPL')
depends=('gtk3' 'gdk-pixbuf2')
makedepends=('git' 'gnome-common' 'gettext' 'intltool' 'pkgconfig')
provides=("gdl=$pkgver")
conflicts=('gdl')
source=("git://git.gnome.org/gdl")
md5sums=('SKIP')
_gitname="gdl"

pkgver() {
 cd $srcdir/$_gitname
 git describe --always | sed 's|[_-]|.|g' |cut -c5-
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
