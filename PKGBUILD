# Maintainer: rafaelff <rafaelff@gnome.org>

_name=girl
pkgname=$_name-git
pkgver=9.5.1.4.g606bbb9
pkgrel=1
pkgdesc="GNOME Internet Radio Locator"
arch=(i686 x86_64)
license=(GPL)
depends=(libgnomeui totem streamripper)
makedepends=(intltool gtk-doc gnome-common git)
provides=($_name)
conflicts=($_name)
url="https://wiki.gnome.org/Apps/Girl"
source=("git+https://git.gnome.org/browse/$_name")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --tags | sed 's/GIRL_//g;s/_/./g;s/-/./g'
}

build() {
  cd "$srcdir/$_name"
  ./autogen.sh --prefix=/usr --with-recording --enable-gtk-doc
  make
}

check(){
  cd "$srcdir/$_name"
  make check
}

package() {
  cd "$srcdir/$_name"
  make DESTDIR="$pkgdir/" install
}
