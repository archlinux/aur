# Maintainer: Iuri Rezende Souza
# Contributor: Anatol Pomozov
# Contributor: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=libnghttp2_asio
pkgver=1.39.1
pkgrel=1
pkgdesc='Framing layer of HTTP/2 is implemented as a reusable C library. ASIO part'
arch=(x86_64)
url='https://nghttp2.org/'
license=(MIT)
depends=(glibc boost-libs "libnghttp2=$pkgver" openssl)
makedepends=(boost)
source=(https://github.com/nghttp2/nghttp2/releases/download/v$pkgver/nghttp2-$pkgver.tar.xz)
sha512sums=('36558ed03c59086086abbf144ec7c54c60de3fea00a9ea594feea7186a779781cbb66a08c9b34265892dea382b42b875f551e85331cfa0086e357f9b27b919fa')

build() {
  cd nghttp2-$pkgver

  autoreconf -i
  ./configure \
    --prefix=/usr \
    --disable-examples \
    --disable-python-bindings \
    --enable-lib-only \
    --enable-asio-lib
  make
}

check() {
  cd nghttp2-$pkgver
  make check
}

package() {
  cd nghttp2-$pkgver/src

  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/libnghttp2_asio/COPYING"
}

