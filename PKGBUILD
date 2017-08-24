# Maintainer: Maxime Vincent <maxime.vince@gmail.com>

pkgname=wolfssl
pkgver=3.12.0
pkgrel=3
pkgdesc='A small, fast, portable implementation of TLS/SSL for embedded devices to the cloud. (formerly CyaSSL) '
arch=(i686 x86_64)
license=(GPL)
depends=('bash')
url='https://www.wolfssl.com/'
source=(https://github.com/wolfSSL/wolfssl/archive/v$pkgver-stable.tar.gz)
sha256sums=('5045f6dc4221a8cf4fa993d020dda0886be4028d0e2cefbf9713b58f6eb0e635')

build() {
  cd $pkgname-$pkgver-stable
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --disable-fastmath \
              --disable-fasthugemath --disable-bump \
              --enable-opensslextra --enable-fortress \
              --enable-keygen --enable-certgen \
              --disable-debug --disable-ntru --disable-examples --enable-distro
  make
}

package() {
  cd $pkgname-$pkgver-stable
  make install DESTDIR="$pkgdir"
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  libtool --finish /usr/lib
}
