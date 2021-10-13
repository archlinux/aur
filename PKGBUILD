# Maintainer: Iuri Rezende Souza
# Maintainer: chn
# Contributor: Anatol Pomozov
# Contributor: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=libnghttp2_asio
pkgver=1.45.1
pkgrel=1
pkgdesc='Framing layer of HTTP/2 is implemented as a reusable C library. ASIO part'
arch=(x86_64)
url='https://nghttp2.org/'
license=(MIT)
depends=(glibc boost-libs "nghttp2=$pkgver" openssl)
makedepends=(boost)
source=(https://github.com/nghttp2/nghttp2/releases/download/v$pkgver/nghttp2-$pkgver.tar.xz)
sha512sums=('320a8c9f29b58c55df98be4312d415bc406edbdfb0765aa37570cdb472a84f40c4f95a51c44c5488363c16ad6815c75b5503b32e43d94724c54117ff583c7150')

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

