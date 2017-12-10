# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=girl
pkgname=$_name-git
pkgver=10.r25.g436baf0
pkgrel=1
pkgdesc="GNOME Internet Radio Locator"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Girl"
license=(GPL)
depends=(gst-plugins-base-libs libgnomeui streamripper totem)
makedepends=(git gnome-common gtk-doc intltool itstool)
provides=($_name)
conflicts=($_name)
source=("git+https://git.gnome.org/browse/$_name")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --long | sed 's/GIRL_//g;s/_/./g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_name"
  ./autogen.sh --prefix=/usr --enable-gtk-doc
  make
}

check(){
  cd "$srcdir/$_name"
  make check
}

package() {
  cd "$srcdir/$_name"
  make DESTDIR="$pkgdir" install
}
