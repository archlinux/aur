# Maintainer: Maxime Vincent <maxime.vince@gmail.com>

pkgname=wolfssl
pkgver=3.10.2
pkgrel=2
pkgdesc='A small, fast, portable implementation of TLS/SSL for embedded devices to the cloud. (formerly CyaSSL) '
arch=(i686 x86_64)
license=(GPL)
depends=('bash')
url='https://www.wolfssl.com/'
source=(https://github.com/wolfSSL/wolfssl/archive/v$pkgver-stable.tar.gz)
sha256sums=('2107635718d25f1aafbeb8b07513ed5feda9afc42de7ce0f2508ce17f2a06b9e')

build() {
  cd $pkgname-$pkgver-stable
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --disable-fastmath \
              --disable-fasthugemath --disable-bump \
              --enable-opensslextra --enable-fortress \
              --enable-keygen --enable-certgen \
              --disable-debug --disable-ntru --disable-examples
  make
}

package() {
  cd $pkgname-$pkgver-stable
  make install DESTDIR="$pkgdir"
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  libtool --finish /usr/lib
}
