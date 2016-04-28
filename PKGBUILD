# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=libprelude
pkgver=3.0.0
pkgrel=1
pkgdesc="Provides the framework for using the Prelude system"
arch=('i686' 'x86_64')
url="http://www.prelude-siem.org"
options=('!libtool')
license=('GPLv2')
depends=('gnutls' 'python2')
makedepends=('swig')
source=(https://www.prelude-siem.org/attachments/download/569/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir"/$pkgname-$pkgver
  CPP="cpp -P" ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	      --without-perl --without-lua --with-python=/usr/bin/python2

  #sed -i '1 i\#include <cstddef>' bindings/python/_PreludeEasy.cxx
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

md5sums=('c93f5735c3dd162835b5597542f05282')
