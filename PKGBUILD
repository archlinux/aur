# Maintainer: Maxime Vincent <maxime.vince@gmail.com>

pkgname=wolfssl
pkgver=3.8.0
pkgrel=2
pkgdesc='Embedded SSL Library for Applications, Devices, IoT, and the Cloud'
arch=(i686 x86_64)
license=(GPL)
url='https://www.wolfssl.com/'
source=(https://github.com/wolfSSL/wolfssl/archive/v$pkgver.tar.gz)
sha1sums=('f4559680b2d18fd6364dee4f744f4e0ac515bb9a')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --disable-fastmath \
              --disable-fasthugemath --disable-bump \
              --enable-opensslextra --enable-fortress \
              --enable-keygen --enable-certgen \
              --disable-debug --disable-ntru --disable-examples
  make
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir"

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
