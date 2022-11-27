# Maintainer: Iuri Rezende Souza
# Maintainer: chn
# Contributor: Anatol Pomozov
# Contributor: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=libnghttp2_asio
pkgver=1.51.0
pkgrel=1
pkgdesc='Framing layer of HTTP/2 is implemented as a reusable C library. ASIO part'
arch=(x86_64)
url='https://nghttp2.org/'
license=(MIT)
depends=(glibc boost-libs "nghttp2=$pkgver" openssl)
makedepends=(boost)
source=(https://github.com/nghttp2/nghttp2/releases/download/v$pkgver/nghttp2-$pkgver.tar.xz)
sha512sums=('0212680e57a15f9afca3b5226429edebd2fe8a52117480007d4472cd0c1bd3aa4d9f21269c637a11efd0f2146a3ee16c3c07ab35d9fb3d4566235d3a14268eeb')

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

