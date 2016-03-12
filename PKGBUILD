# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Nick Parastatidis <nparasta@auth.gr>

pkgname=libenglab
pkgver=0.3.0
pkgrel=2
pkgdesc="Main library for Englab, a mathematical platform" 
url="http://www.englab.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gsl')
source=(http://downloads.sourceforge.net/englab/$pkgname-$pkgver.tar.gz gsltest.patch)
md5sums=('f8b9f9ec9c825210d6abe3d63b42291f'
         'bb6c817dd436bbd7607542021eb68d08')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 < "$srcdir"/gsltest.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr 
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
