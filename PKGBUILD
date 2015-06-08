# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=repo-util
pkgrel=1
pkgver=1.9.2 # do not flag out of date, 1.9.4 does not build
pkgdesc="A supplement to repo-add which simplifies updating local repositories"
arch=('x86_64' 'i686')
url="https://github.com/cassava/$pkgname"
license=('custom:MIT')
depends=('glibc')
source=("https://github.com/cassava/$pkgname/archive/$pkgver.tar.gz")
md5sums=('78f14c5efc93bb596a42fd41bff1aa5e')

build() {
  cd $pkgname-$pkgver
  install -d config
  aclocal
  automake --add-missing
  autoreconf
  ./configure --prefix="/usr" 
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
