# Maintainer: Maxime Vincent <maxime.vince@gmail.com>

pkgname=wolfssl
pkgver=3.9.8
pkgrel=2
pkgdesc='A small, fast, portable implementation of TLS/SSL for embedded devices to the cloud. (formerly CyaSSL) '
arch=(i686 x86_64)
license=(GPL)
depends=('bash')
url='https://www.wolfssl.com/'
source=(https://github.com/wolfSSL/wolfssl/archive/v$pkgver.tar.gz)
sha1sums=('f196523e9ed50e5ab08d7f6b90cdad827178db2f')

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
  libtool --finish /usr/lib
}
