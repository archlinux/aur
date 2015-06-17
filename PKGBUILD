# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=cyassl
pkgver=3.3.0
pkgrel=1
pkgdesc='A small, fast, portable implementation of TLS/SSL for embedded devices to the cloud'
arch=(i686 x86_64)
license=(GPL)
url='https://www.yassl.com/'
source=(https://github.com/cyassl/cyassl/archive/v$pkgver.zip)
sha1sums=('969713afc5ba0056e80691d535aa002f94d5858e')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --disable-fastmath \
              --disable-fasthugemath --disable-bump \
              --enable-opensslextra --enable-fortress \
              --enable-keygen --enable-certgen \
              --disable-debug --disable-ecc \
              --disable-ntru --disable-examples

  make
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir"

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
