# Maintainer: Maxime Vincent <maxime.vince@gmail.com>

_pkgname=wolfssl
pkgname=${_pkgname}-git
pkgver=20170824.73b8be8f
pkgrel=2
pkgdesc='A small, fast, portable implementation of TLS/SSL for embedded devices to the cloud. (formerly CyaSSL) '
arch=(i686 x86_64)
license=(GPL)
depends=('bash')
makedepends=('git')
url='https://www.wolfssl.com/'
source=(git+https://github.com/wolfSSL/wolfssl.git)
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

build() {
  cd $_pkgname
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --disable-fastmath \
              --disable-fasthugemath --disable-bump \
              --enable-opensslextra --enable-fortress \
              --enable-keygen --enable-certgen \
              --disable-debug --disable-ntru --disable-examples --enable-distro
  make
}

package() {
  cd $_pkgname
  make install DESTDIR="$pkgdir"
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$_pkgname/COPYING
  libtool --finish /usr/lib
}
