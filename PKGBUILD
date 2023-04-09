# Maintainer: Iuri Rezende Souza
# Maintainer: chn
# Contributor: Anatol Pomozov
# Contributor: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=libnghttp2_asio
pkgver=1.52.0
pkgrel=1
pkgdesc='Framing layer of HTTP/2 is implemented as a reusable C library. ASIO part'
arch=(x86_64)
url='https://nghttp2.org/'
license=(MIT)
depends=(glibc boost-libs "nghttp2=$pkgver" openssl)
makedepends=(boost)
source=(https://github.com/nghttp2/nghttp2/releases/download/v$pkgver/nghttp2-$pkgver.tar.xz)
sha512sums=('3af1ce13270f7afc8652bd3de71200d9632204617fe04d2be7156d60eeb1a5cc415573677791a399ae03577e8e3256939b1b05d27dbd98dee504d09ec5325d56')

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

