# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=rawstudio-git
pkgver=20160225.6643b14
pkgrel=2
pkgdesc="Raw-image converter written in GTK2"
arch=('i686' 'x86_64')
url="http://rawstudio.org/"
license=('GPL')
depends=('osm-gps-map' 'desktop-file-utils' 'libgphoto2' 'fftw' 'gconf' 'lcms2' 'exiv2' 'lensfun')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git://github.com/rawstudio/rawstudio.git")
md5sums=('SKIP')
_gitname="${pkgname%-git}"

pkgver() {
  cd "$srcdir"/"$_gitname"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "$srcdir"/"$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
