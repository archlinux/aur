pkgname=dg100ctl
pkgver=0.1
pkgrel=3
pkgdesc="Program to configure the GlobalSat DG-100 GPS data logger"
url="http://launchpad.net/$pkgname"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt6-base')
makedepends=('cmake')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.bz2 qt6.patch)
md5sums=('07008d7366148c2e1811ca20f8ccd9c4'
         '81195bd97ed5d549636e2a463c414487')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=2 --input=${srcdir}/qt6.patch
}

build() {
  cd "$pkgname-$pkgver"
  mkdir build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$pkgname-$pkgver"
  cd build
  make DESTDIR="$pkgdir" install
}