# Maintainer: Tinu Weber <takeya@bluewin.ch>

pkgname=ttylog
pkgver=0.29
pkgrel=1
pkgdesc='A serial port logger'
arch=('x86_64')
url='http://ttylog.sourceforge.net/'
license=('GPL2')
makedepends=(cmake)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/${pkgname}-${pkgver}.tar.gz"
        'bindir.patch')
md5sums=('1cefb8acc85b9d7daf211e2cf08ecc04'
         'b7316a7afe36d858cf4d6c47f05b0d2a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../bindir.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -D CMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
