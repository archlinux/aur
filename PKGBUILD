# Maintainer: Rafael Ferreira <rafael.f.f1@gmail.com>

_name=gnome-2048
pkgname=$_name-git
pkgver=3.17.90.r101.253e3c0
pkgrel=1
pkgdesc="Obtain the 2048 tile"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/2048"
license=('GPL')
depends=('clutter-gtk' 'libgee' 'libgames-support-git')
makedepends=('vala' 'yelp-tools' 'gnome-common' 'intltool' 'git' 'appstream-glib')
options=(!libtool)
install=$_name.install
provides=($_name)
conflicts=($_name)
source=(git+https://git.gnome.org/browse/$_name)
md5sums=('SKIP')

pkgver() {
  cd $_name
  v=$(grep AC_INIT configure.ac | cut -d[ -f3 | cut -d] -f1)
  printf "%s.r%s.%s" $v $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd $_name
  ./autogen.sh --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd $_name
  make DESTDIR="$pkgdir" install
}
