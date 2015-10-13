# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=xfractint  
pkgver=20.04p14
pkgrel=3
pkgdesc="A fractal generator wellknown from good old DOS days"
url="http://www.fractint.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxft')
makedepends=('yasm' 'git')
source=(fractint.sh \
git+https://github.com/stefanhusmann/xfractint.git)
md5sums=('90a680dbcee2063e05c2e9c0b235649d'
         'SKIP')

build() {
  cd $srcdir/$pkgname/$pkgname-$pkgver
  make PREFIX=/usr AS=yasm fractint 
}

package() {
  cd $srcdir/$pkgname/$pkgname-$pkgver
  make DESTDIR=$pkgdir/usr install
  install -Dm755 $srcdir/fractint.sh $pkgdir/etc/profile.d/xfractint.sh 
}
