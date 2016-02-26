# Maintainer: zhangjun (zhangjunphy AT gmail DOT com)

pkgname=libcuba
pkgver=4.2
pkgrel=1
pkgdesc='A library for mutidimensional numerical integration'
arch=('any')
url="http://www.feynarts.de/cuba/"
license=('LGPL')
makedepends=('make' 'automake')
source=("http://www.feynarts.de/cuba/Cuba-$pkgver.tar.gz")
md5sums=('a3eb0751d4872a3f86401694bc5bedae')

build() {
  cd "$srcdir/Cuba-$pkgver"
  ./configure --prefix=/usr

  # build a shared library
  sed 's/CFLAGS = /CFLAGS = -fPIC /g' --in-place makefile
  make
  FILES=$(ar xv libcuba.a | sed 's/x - //g')
  gcc -shared -o libcuba.so $FILES
}

check() {
  cd "$srcdir/Cuba-$pkgver"
  make -k check
}

package() {
  cd "$pkgdir"
  install -Dm 644 "$srcdir/Cuba-$pkgver/cuba.pdf" usr/share/doc/cuba/cuba.pdf
  install -Dm 644 "$srcdir/Cuba-$pkgver/libcuba.so" usr/lib/libcuba.so
  install -Dm 644 "$srcdir/Cuba-$pkgver/cuba.h" usr/include/cuba.h
}
