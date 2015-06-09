# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=libprelude
pkgver=1.2.5
pkgrel=2
pkgdesc="Provides the framework for using the Prelude system"
arch=('i686' 'x86_64')
url="http://www.prelude-ids.org"
options=('!libtool')
license=('GPLv2')
depends=('gnutls' 'python2')
makedepends=('swig')
source=(https://www.prelude-ids.org/attachments/download/351/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir"/$pkgname-$pkgver
  CPP="cpp -P" ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	      --without-perl --without-lua --with-python=/usr/bin/python2

  sed -i '1 i\#include <cstddef>' bindings/python/_PreludeEasy.cxx
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

md5sums=('626dfa935ad68cedc73f5263ae7e9c54')
