# Contributor: Nick Parastatidis <nparasta@auth.gr>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libenglab-dsp
pkgver=0.3.0
pkgrel=4
pkgdesc="Englab toolbox for digital signal processing"
url="https://sourceforge.net/projects/englab/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libsndfile' 'audiere' 'libenglab' 'fftw')
source=(http://downloads.sourceforge.net/englab/$pkgname-$pkgver.tar.gz)
md5sums=('471cd4029beb78c1db1e092552c5a434')
install=libenglab-dsp.install

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr CXXFLAGS="-O0" 
  make
}

package(){
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  
  cd "$pkgdir"/usr/lib
  ln ${pkgname}.so.0.3 ${pkgname}.so
}
