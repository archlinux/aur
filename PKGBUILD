# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=spdylay
pkgver=1.4.0
_pkgver=v1.4.0
pkgrel=1
pkgdesc="The experimental SPDY protocol version 2, 3 and 3.1 implementation in C"
arch=('i686' 'x86_64')
url="http://tatsuhiro-t.github.io/spdylay/"
license=('MIT')
depends=('libevent' 'libxml2' 'openssl' 'zlib')
source=("https://github.com/tatsuhiro-t/spdylay/releases/download/${_pkgver}/spdylay-${pkgver}.tar.gz")
backup=('etc/shrpx/shrpx.conf')
sha256sums=('f45641df48f0f8e13fe80166437828201b46f56681b11cd93a614a82ebd5dcba')

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
