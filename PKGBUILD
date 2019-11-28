# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=gdl-git
pkgver=3.28.0
pkgrel=1
pkgdesc="GNOME Docking Libraries, git version"
arch=('i686' 'x86_64')
url="https://developer.gnome.org/gdl/"
license=('GPL')
depends=('gtk3' 'gdk-pixbuf2' 'pango' 'cairo')
makedepends=('git' 'gnome-common' 'gettext' 'intltool' 'pkgconfig')
provides=("gdl=$pkgver")
conflicts=('gdl')
source=("git://git.gnome.org/gdl")
md5sums=('SKIP')
_gitname="gdl"

pkgver() {
  cd $srcdir/$_gitname
  printf "%s" "$(git describe|cut -c5-|tr - .|tr _ .)"
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
