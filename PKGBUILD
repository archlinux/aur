# Maintainer: Rafael Ferreira <rafael.f.f1@gmail.com>

_name=girl
pkgname=$_name-git
pkgver=1.0.0.10.g8628aa8
pkgrel=1
pkgdesc="Locate Internet Radio Stations for GNOME"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Girl"
license=('GPL')
depends=('streamripper' 'totem' 'libgnomeui' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('gnome-common' 'intltool' 'git')
options=(!libtool)
install=$_name.install
provides=($_name)
conflicts=($_name)
source=(git://git.gnome.org/$_name)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --tags | sed -e 's/GIRL_//;s/_/./g;s/-/./g'
}

build() {
  cd "$srcdir/$_name"

  ./autogen.sh --prefix=/usr --with-recording
  make
}

package() {
  cd "$srcdir/$_name"
  make DESTDIR="$pkgdir/" install
}
