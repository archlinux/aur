
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Thibaud Mouton <>
pkgname=('libboard')  
pkgver=0.9.0
pkgrel=3 
pkgdesc="C++ library for simple Postscript, SVG, and XFig drawings"
url="http://libboard.sourceforge.net"
arch=('x86_64')
license=('LGPL')
depends=('gcc-libs')
makedepends=('doxygen')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-${pkgver}.tar.gz" configure.diff)
md5sums=('6dc8049db96eb852d5d3946cd042ace4'
         '376eb103386057b7b3bb31c5648660ed')
build() {
  cd "$pkgbase-$pkgver"
  patch < $srcdir/configure.diff || return 1 
  ./configure --prefix=/usr || return 1 
  make CXXFLAGSOBJ="-ansi -pedantic -Wall -W  -I./include -fPIC" || return 1
  make doc || return 1
}
package()
{
  cd "$pkgbase-$pkgver"
  make PREFIX=$pkgdir/usr install || return 1
  make PREFIX=$pkgdir/usr install-doc || return 1
}
