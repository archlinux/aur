# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Nick Parastatidis <nparasta@auth.gr>

pkgname=englabgui
pkgver=0.3.0
pkgrel=3
pkgdesc="Graphical User Interface for Englab calculations platform" 
url="https://sourceforge.net/projects/englab/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libenglab' 'qt4')
source=(http://downloads.sourceforge.net/englab/$pkgname-$pkgver.tar.gz 'makefile.patch')
md5sums=('8fdcbb7133a61550e06ece1b3f527dfa'
         '7dd82efefcc16c1124546f161b8f7e0a')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -p1 < "$srcdir"/makefile.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr CXXFLAGS="-O0"
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
