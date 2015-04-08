# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=spdylay
pkgver=1.3.2
_pkgver=v1.3.2
pkgrel=1
pkgdesc="The experimental SPDY protocol version 2, 3 and 3.1 implementation in C"
arch=('i686' 'x86_64')
url="http://tatsuhiro-t.github.io/spdylay/"
license=('MIT')
depends=('libevent' 'libxml2' 'openssl' 'zlib')
source=("https://github.com/tatsuhiro-t/spdylay/releases/download/${_pkgver}/spdylay-${pkgver}.tar.gz")
backup=('etc/shrpx/shrpx.conf')
sha256sums=('7b435d477ed5ecf74959e9c0ef357212bb75e7b97cdbaceba8d1d64c3c4c6e90')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 shrpx.conf.sample "$pkgdir/etc/shrpx/shrpx.conf"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/spdylay/COPYING"
}
