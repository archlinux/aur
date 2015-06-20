# Maintainer: Laurent Hofer <laurenth at laurenth dot net>
pkgname=fltk-xcas
pkgver=1.3.0
pkgrel=1
pkgdesc="Graphical user interface toolkit for X modified by giac/xcas' author"
arch=('i686' 'x86_64')
url="http://www-fourier.ujf-grenoble.fr/~parisse/giac.html"
license=('GPL')
depends=('libjpeg' 'libxinerama' 'libxft')
makedepends=()
checkdepends=()
optdepends=()
provides=('fltk')
conflicts=('fltk')
install=
source=("http://www-fourier.ujf-grenoble.fr/~parisse/giac/freebsd/fltk-giac.tar.gz")
md5sums=('d71fee3a06747f263d81e7142306ab5b')

build() {
  cd "$srcdir/fltk-$pkgver"
  CFLAGS="-march=native -O2 -pipe"
  CXXFLAGS="${CFLAGS} -fPIC"
  ./configure --prefix=/usr --enable-xft --enable-threads --enable-shared
  make
}

package() {
  cd "$srcdir/fltk-$pkgver"
  make DESTDIR="$pkgdir/" install
  chmod 644 $pkgdir/usr/lib/*
}
