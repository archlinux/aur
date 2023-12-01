# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=chronojump
pkgname=$_name-git
pkgver=2.3.0.1009.g1fdf0e54f
pkgrel=1
pkgdesc="Measurement, management and statistics of sport short-time tests"
arch=(x86_64)
url="https://chronojump.org/"
license=(GPL2)
depends=(python gtk-sharp-3)
makedepends=(mono intltool git)
provides=($_name)
conflicts=($_name)
options=(!libtool)
install=$pkgname.install
source=("git+https://gitlab.gnome.org/GNOME/$_name.git")
md5sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long | sed 's/-/./g'
}

prepare() {
  cd "$_name"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$_name"
  ./configure --prefix=/usr
  make
}

# https://gitlab.gnome.org/GNOME/chronojump/-/issues/637
check() {
  cd "$_name"
  make -k check || true
}

package() {
  cd "$_name"
  make DESTDIR="$pkgdir" install
}
