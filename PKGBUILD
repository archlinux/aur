# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=gnome-2048
pkgname=$_name-git
pkgver=3.26.1.r220.27eac00
pkgrel=1
pkgdesc="Obtain the 2048 tile"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/2048"
license=('GPL')
depends=('clutter-gtk' 'libgnome-games-support')
makedepends=('git' 'intltool' 'appstream-glib' 'yelp-tools' 'vala')
options=(!libtool)
provides=($_name)
conflicts=($_name)
source=("git+https://git.gnome.org/browse/$_name")
md5sums=('SKIP')

pkgver() {
  cd $_name
  v=$(grep AC_INIT configure.ac | cut -d[ -f3 | cut -d] -f1)
  printf "%s.r%s.%s" $v $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd $_name
  ./autogen.sh NOCONFIGURE=1
}

build() {
  cd $_name
  ./configure --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd $_name
  make DESTDIR="$pkgdir" install
}
